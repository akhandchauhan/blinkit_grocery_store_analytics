# Grocery Sales Analysis - Blinkit

## Overview

This project provides an in-depth analysis of grocery sales data from **Blinkit**. The analysis covers various aspects of the data, including total sales, sales by item type, fat content, outlet types, visibility, and more. The goal is to understand sales patterns, detect anomalies, and provide actionable insights for business improvement.

---

## Setup

### Requirements
- **MySQL** or another relational database management system (RDBMS)
- SQL Workbench or similar query tool

---

## Analysis Queries

The following SQL queries were executed to gain insights into the sales data.


![describe](https://github.com/user-attachments/assets/917b8b49-e0e3-418f-b976-37e1cde16e1e)


### 1. **Handling Missing Values in Total Sales**

Before starting the analysis, we ensured there were no missing values in the `Total_Sales` column. If any were found, the strategy was to use `COALESCE` to impute missing values with either the mean or median sales values.

**Output:**  
*No missing values were found.*
![null](https://github.com/user-attachments/assets/347c6288-1e8d-467d-9c96-68028c35bb50)

![dup_cnt](https://github.com/user-attachments/assets/db0012eb-0fc9-4304-86a8-ca254a5d13d8)

---

### 2. **Descriptive Statistics**

Basic descriptive statistics for various columns including `Outlet_Est_Year`, `Item_Visibility`, `Item_Weight`, and `Total_Sales` were calculated.

**Output:**
![descriptive_stat1](https://github.com/user-attachments/assets/b64556cf-678b-43a9-a787-51000b0bb9ed)
![descriptive_stat2](https://github.com/user-attachments/assets/c70f666d-6157-41e1-ac08-22a657c7da5b)


---

### 3. **Total Sales by Fat Content**

This query aggregates total sales by `Item_Fat_Content`, allowing us to understand which fat content category performs the best in terms of sales.

**Output:**

![image](https://github.com/user-attachments/assets/e8f324bf-5956-46df-9dd0-043bb936585e)


---

### 4. **Sales by Item Type**

Aggregating total sales by `Item_Type` helps us understand which product categories are driving sales.

**Output:**

![image](https://github.com/user-attachments/assets/bd63707f-387a-4f45-a23c-bc1a4f2f490a)


---

### 5. **Top 3 Outlets by Total Sales (After 2005)**

Using a `DENSE_RANK()` window function, this query identifies the top three outlets by aggregated sales, but only includes outlets established after the year 2005.

**Output:**

![image](https://github.com/user-attachments/assets/4c060fcf-374c-4d92-8baa-9f2f50912a36)


---

### 6. **Rolling 3-Year Average of Total Sales**

A rolling average was calculated for total sales, grouped by the year of outlet establishment.

**Output:**

![image](https://github.com/user-attachments/assets/c80d867c-c558-4d06-81d8-02442afbd9b3)


---

### 7. **Percentage of Sales by Outlet Size**

This query calculates the percentage of total sales by `Outlet_Size`, allowing us to identify which outlet sizes contribute the most to total sales.

**Output:**

![image](https://github.com/user-attachments/assets/3334416d-a792-402b-a5cd-26bb81c02b33)


---

### 8. **Sales by Outlet Location Type**

The total sales aggregated by the outlet's location type provide insight into the geographical distribution of sales.

**Output:**

![image](https://github.com/user-attachments/assets/81b02b0f-19b5-4df6-b533-c1138e2672be)


---

### 9. **Top Items Sold Per Outlet Type**

Identifying the top-selling items within each outlet type can help with inventory planning and marketing strategies.

**Output:**

![image](https://github.com/user-attachments/assets/271698a3-008c-420e-92ef-1b898e88854c)


---

### 10. **Item Visibility Outliers**

By detecting unusually high or low item visibility, we can identify potential issues or opportunities for better item placement and marketing.

**Output:**

![image](https://github.com/user-attachments/assets/38280cde-18b3-4758-a9a7-c2c3caeff7c7)


---

### 11. **Avg Rating by Fat Content**

This query calculates the average rating of items, grouped by fat content.

**Output:**

![image](https://github.com/user-attachments/assets/a6a1d68e-9258-43fb-9660-caf96a7dd897)



---



---

## Data Analysis Insights

# Data Cleaning and Analysis Report

## 1. Data Cleaning
- **Column Names:** Some column names had spaces, which were replaced with underscores for easier querying.
- **Item Weight:** Missing values were found in the "Item Weight" column (1,463 missing out of 8,523 records).
- **Standardization of Item Fat Content:** 
  - 'LF' and 'low fat' → 'Low Fat'
  - 'reg' → 'Regular'

## 2. Null & Duplicate Check
- **Missing Values:** No missing values in key columns except "Item Weight".
- **Duplicates:** Duplicates in "Item Identifier" indicate that the same item was sold multiple times.

## 3. Descriptive Statistics
- **Outlets:** Established between 1985 (oldest) and 2022 (newest).
  
### Sales Insights:
- **Total Sales:** Over $50 million.
- **Highest Single Sale:** Around $13,000.
- **Average Sales per Item:** ~$1,000.

### Visibility:
- Some items had very low visibility, indicating potential under-promotion.

## 4. Key Insights from SQL Queries

### Item Sales & Fat Content:
- Regular fat content products contribute more to total sales.
- Average ratings are slightly higher for Low Fat products.

### Outlet Performance:
- **Top 3 Outlets** (by total sales) were established after 2005 and have the highest revenue.
- **Sales Distribution by Outlet Size:**
  - Medium-sized outlets dominate sales (~45%).
  - Small outlets follow (~35%).
- **Tier 3 locations** have the highest total sales.

### Item Popularity:
- Frozen Foods, Dairy, and Soft Drinks are among the most sold categories.
- Top-selling items vary by outlet type, meaning customer preferences shift based on store type.

### Rolling Sales Trends:
- A rolling 3-year sales average shows increasing trends over time.

### Unusual Item Visibility:
- Some outlets have significantly higher or lower item visibility, which could indicate different marketing strategies or stock placement issues.

---

## Conclusion

This analysis provides a comprehensive understanding of grocery sales patterns, identifying key factors like item type, outlet size, and item visibility. By leveraging these insights, Blinkit can make informed decisions to optimize inventory, marketing strategies, and sales forecasting.

---
