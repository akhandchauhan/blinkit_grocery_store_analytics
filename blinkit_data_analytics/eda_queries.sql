-- Table Structure
DESC blinkit_grocery_table;

-- Preview the table
SELECT *
FROM blinkit_grocery_table
LIMIT 10;

-- remove spaces from columns
ALTER TABLE blinkit_grocery_table 
CHANGE COLUMN `﻿Item Fat Content` Item_Fat_Content TEXT,
CHANGE COLUMN `Item Identifier` Item_Identifier TEXT,
CHANGE COLUMN `Item Type` Item_Type TEXT,
CHANGE COLUMN `Outlet Establishment Year` Outlet_Est_Year INT, 
CHANGE COLUMN `Outlet Identifier` Outlet_Identifier TEXT, 
CHANGE COLUMN `Outlet Location Type` Outlet_Location_Type TEXT, 
CHANGE COLUMN `Outlet Size` Outlet_Size TEXT, 
CHANGE COLUMN `Outlet Type` Outlet_Type TEXT, 
CHANGE COLUMN `Item Visibility` Item_Visibility DOUBLE, 
CHANGE COLUMN `Item Weight` Item_Weight INT, 
CHANGE COLUMN `Total Sales` Total_Sales DOUBLE;

-- check for null
SELECT 
    COUNT(*) - COUNT(Item_Fat_Content) AS Item_Fat_Content_Nulls,
    COUNT(*) - COUNT(Item_Identifier) AS Item_Identifier_Nulls,
    COUNT(*) - COUNT(Item_Type) AS Item_Type_Nulls,
    COUNT(*) - COUNT(Outlet_Est_Year) AS Outlet_Est_Year_Nulls,
    COUNT(*) - COUNT(Outlet_Identifier) AS Outlet_Identifier_Nulls,
    COUNT(*) - COUNT(Outlet_Location_Type) AS Outlet_Location_Type_Nulls,
    COUNT(*) - COUNT(Outlet_Size) AS Outlet_Size_Nulls,
    COUNT(*) - COUNT(Outlet_Type) AS Outlet_Type_Nulls,
    COUNT(*) - COUNT(Item_Visibility) AS Item_Visibility_Nulls,
    COUNT(*) - COUNT(Item_Weight) AS Item_Weight_Nulls,
    COUNT(*) - COUNT(Total_Sales) AS Total_Sales_Nulls
FROM blinkit_grocery_table;

-- check for duplicates for item_identifier
SELECT Item_Identifier, COUNT(Item_Identifier) as dup_cnt
FROM blinkit_grocery_table
GROUP BY Item_Identifier
HAVING COUNT(*) >1
ORDER BY 2 DESC;

-- > INFERENCE = > MANY ITEMS ARE ORDERED MANY TIMES.

-- descriptive statistics
SELECT 
    MIN(Outlet_Est_Year) AS Min_Outlet_Est_Year,
    MAX(Outlet_Est_Year) AS Max_Outlet_Est_Year,
    ROUND(AVG(Outlet_Est_Year),0) AS Avg_Outlet_Est_Year,
    
    MIN(Item_Visibility) AS Min_Item_Visibility,
    MAX(Item_Visibility) AS Max_Item_Visibility,
    AVG(Item_Visibility) AS Avg_Item_Visibility,
    STD(Item_Visibility) AS Std_Item_Visibility,
    
    MIN(Item_Weight) AS Min_Item_Weight,
    MAX(Item_Weight) AS Max_Item_Weight,
    AVG(Item_Weight) AS Avg_Item_Weight,
    
    MIN(Total_Sales) AS Min_Total_Sales,
    MAX(Total_Sales) AS Max_Total_Sales,
    AVG(Total_Sales) AS Avg_Total_Sales,
    STD(Total_Sales) AS Std_Total_Sales
FROM blinkit_grocery_table;


-- make all categories correct
UPDATE blinkit_grocery_table
SET Item_Fat_Content = 
CASE WHEN Item_Fat_Content IN ('LF','low fat') THEN 'Low Fat'
WHEN Item_Fat_Content = 'reg' THEN 'Regular'
ELSE Item_Fat_Content
end;

-- Frequency for Item_Fat_Content
SELECT Item_Fat_Content, COUNT(*) AS Frequency
FROM blinkit_grocery_table
GROUP BY Item_Fat_Content
ORDER BY Frequency DESC;

-- Frequency for Item_Type
SELECT Item_Type, COUNT(*) AS Frequency
FROM blinkit_grocery_table
GROUP BY Item_Type
ORDER BY Frequency DESC;
