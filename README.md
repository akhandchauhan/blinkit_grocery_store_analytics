Grocery Sales Analysis - Blinkit
Overview
This project provides an in-depth analysis of grocery sales data from Blinkit. The analysis covers various aspects of the data, including total sales, sales by item type, fat content, outlet types, visibility, and more. The goal is to understand sales patterns, detect anomalies, and provide actionable insights for business improvement.

Setup
Requirements
MySQL or another relational database management system (RDBMS)
SQL Workbench or similar query tool
Python (Optional, for visualizations and animations)
Power BI or Excel for interactive reports (Optional)
Analysis Queries
The following SQL queries were executed to gain insights into the sales data.

1. Handling Missing Values in Total Sales
Before starting the analysis, we ensured there were no missing values in the Total_Sales column. If any were found, the strategy was to use COALESCE to impute missing values with either the mean or median sales values.

Output: No missing values were found.

2. Descriptive Statistics
Basic descriptive statistics for various columns including Outlet_Est_Year, Item_Visibility, Item_Weight, and Total_Sales were calculated.

Output:

3. Total Sales by Fat Content
This query aggregates total sales by Item_Fat_Content, allowing us to understand which fat content category performs the best in terms of sales.

Output:

4. Sales by Item Type
Aggregating total sales by Item_Type helps us understand which product categories are driving sales.

Output:

5. Top 3 Outlets by Total Sales (After 2005)
Using a DENSE_RANK() window function, this query identifies the top three outlets by aggregated sales, but only includes outlets established after the year 2005.

Output:

6. Rolling 3-Year Average of Total Sales
A rolling average was calculated for total sales, grouped by the year of outlet establishment.

Output:

7. Percentage of Sales by Outlet Size
This query calculates the percentage of total sales by Outlet_Size, allowing us to identify which outlet sizes contribute the most to total sales.

Output:

8. Sales by Outlet Location Type
The total sales aggregated by the outlet's location type provide insight into the geographical distribution of sales.

Output:

9. Top Items Sold Per Outlet Type
Identifying the top-selling items within each outlet type can help with inventory planning and marketing strategies.

Output:

10. Item Visibility Outliers
By detecting unusually high or low item visibility, we can identify potential issues or opportunities for better item placement and marketing.

Output:

11. Avg Rating by Fat Content
This query calculates the average rating of items, grouped by fat content.

Output:
