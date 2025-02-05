

-- Total Sales
SELECT CONCAT(
         CAST(SUM(Total_Sales) / 1000000 AS DECIMAL(10,2)), ' million') AS Total_Sales_Millions
FROM blinkit_grocery_table;

-- avg sales

SELECT AVG(Total_Sales) AS Avg_Sales
FROM blinkit_grocery_table;

-- avg ratings for item sold
SELECT AVG(rating) as rating
FROM blinkit_grocery_table;

-- Design a query that computes the average total sales for each Item Type, but only 
--includes groups with at least three records.

SELECT Item_Type, ROUND(AVG(total_sales),2) as avg_sales_cnt_three
FROM blinkit_grocery_table
GROUP BY Item_Type
HAVING COUNT(Item_Type)>3;


-- query to identify the top three outlets (by Outlet Identifier) with 
-- the highest aggregated total sales from items, restricting your analysis to 
-- outlets established after the year 2005.

WITH outlet_rnk_cte as(
SELECT Outlet_Identifier, DENSE_RANK() OVER(ORDER BY SUM(Total_Sales) DESC) as outlet_rnk
FROM blinkit_grocery_table
WHERE Outlet_Est_Year > 2005
GROUP BY Outlet_Identifier
)
SELECT Outlet_Identifier
FROM outlet_rnk_cte
WHERE outlet_rnk <=3;

--  query that calculates the average rating for each combination of Outlet Type and Outlet Size. 

SELECT Outlet_Type, AVG(Rating) as avg_rating
FROM blinkit_grocery_table
GROUP BY Outlet_Type
ORDER BY AVG(Rating) DESC;

--  strategy for dealing with missing values in the Total Sales column. 
--  imputation methods to consider, and  validate that my chosen method does not bias the overall sales analysis


-- no missing records as done by my previous analysis.
-- but if there was missing data my strategy would be

-- Identify and count the missing Total Sales values.
-- Compute the average (or median) Total Sales from non-missing records.
-- Impute missing values using COALESCE with the computed central measure.
-- Validate the imputation by comparing summary statistics before and after the process.


-- query that calculates a rolling three-year average of total sales 
-- grouped by Outlet Establishment Year

WITH YearlySales AS (
    SELECT Outlet_Est_Year, AVG(total_sales) AS avg_sales
    FROM blinkit_grocery_table
    GROUP BY Outlet_Est_Year
)
SELECT 
    Outlet_Est_Year,
    avg_sales,
    AVG(avg_sales) OVER(ORDER BY Outlet_Est_Year ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS rolling_avg_sales
FROM YearlySales
ORDER BY Outlet_Est_Year;


-- Total Sales by Fat Content:

SELECT Item_Fat_Content, SUM(Total_Sales) as sales_by_fat
FROM blinkit_grocery_table
GROUP by Item_Fat_Content


-- Avg rating by Fat content:

SELECT Item_Fat_Content, AVG(Rating) as rating_by_fat
FROM blinkit_grocery_table
GROUP by Item_Fat_Content
ORDER BY 2 DESC;

-- No. of items by fat content

SELECT Item_Fat_Content, COUNT(Item_Identifier) as item_cnt_by_fat
FROM blinkit_grocery_table
GROUP by Item_Fat_Content
ORDER BY 2 DESC;

-- Fat Content by Outlet for Total Sales

SELECT Outlet_Identifier, item_Fat_Content, SUM(Total_Sales) as sales_fat_per_outlet
FROM blinkit_grocery_table
GROUP BY Outlet_Identifier ,item_Fat_Content
ORDER BY 1,2,3 DESC;

-- Total Sales by Outlet Establishment

SELECT Outlet_Est_Year, ROUND(SUM(Total_Sales), 2) as sales_per_est_yr
FROM blinkit_grocery_table
GROUP BY Outlet_Est_Year
ORDER BY 2 DESC;

-- Percentage of Sales by Outlet Size

SELECT Outlet_Size, 
ROUND(SUM(Total_Sales) *100/(SELECT SUM(Total_Sales) FROM blinkit_grocery_table),2) as percent_sale_outlet_size
FROM blinkit_grocery_table
GROUP BY Outlet_Size
ORDER BY 2 DESC;

-- Sales by Outlet Location

SELECT Outlet_Location_Type, ROUND(SUM(Total_Sales), 2) as sales_location
FROM blinkit_grocery_table
GROUP BY Outlet_Location_Type
ORDER BY 2 DESC;

-- top item_sold per outlet_type
WITH RankedSales AS (
    SELECT 
        Item_Identifier, Outlet_Type, Total_Sales,
        RANK() OVER (PARTITION BY Outlet_Type ORDER BY Total_Sales DESC) AS rnk
    FROM blinkit_grocery_table
)
SELECT Item_Identifier, Outlet_Type, Total_Sales
FROM RankedSales
WHERE rnk = 1;

-- Detect Outlets with unusually high/low item visibility
SELECT 
    Outlet_Identifier,
    AVG(Item_Visibility) AS Avg_Visibility
FROM blinkit_grocery_table
GROUP BY Outlet_Identifier
HAVING AVG(Item_Visibility) > (SELECT AVG(Item_Visibility) FROM blinkit_grocery_table) * 1.5
   OR AVG(Item_Visibility) < (SELECT AVG(Item_Visibility) FROM blinkit_grocery_table) * 0.5;

