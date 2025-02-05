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

### 1. **Handling Missing Values in Total Sales**

Before starting the analysis, we ensured there were no missing values in the `Total_Sales` column. If any were found, the strategy was to use `COALESCE` to impute missing values with either the mean or median sales values.

**Output:**  
*No missing values were found.*

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

![Sales by Fat Content](path/to/your/image2.png)

---

### 4. **Sales by Item Type**

Aggregating total sales by `Item_Type` helps us understand which product categories are driving sales.

**Output:**

![Sales by Item Type](path/to/your/image3.png)

---

### 5. **Top 3 Outlets by Total Sales (After 2005)**

Using a `DENSE_RANK()` window function, this query identifies the top three outlets by aggregated sales, but only includes outlets established after the year 2005.

**Output:**

![Top 3 Outlets](path/to/your/image4.png)

---

### 6. **Rolling 3-Year Average of Total Sales**

A rolling average was calculated for total sales, grouped by the year of outlet establishment.

**Output:**

![Rolling Average of Sales](path/to/your/image5.gif)

---

### 7. **Percentage of Sales by Outlet Size**

This query calculates the percentage of total sales by `Outlet_Size`, allowing us to identify which outlet sizes contribute the most to total sales.

**Output:**

![Percentage of Sales by Outlet Size](path/to/your/image6.png)

---

### 8. **Sales by Outlet Location Type**

The total sales aggregated by the outlet's location type provide insight into the geographical distribution of sales.

**Output:**

![Sales by Location Type](path/to/your/image7.png)

---

### 9. **Top Items Sold Per Outlet Type**

Identifying the top-selling items within each outlet type can help with inventory planning and marketing strategies.

**Output:**

![Top Items Sold per Outlet Type](path/to/your/image8.png)

---

### 10. **Item Visibility Outliers**

By detecting unusually high or low item visibility, we can identify potential issues or opportunities for better item placement and marketing.

**Output:**

![Item Visibility Outliers](path/to/your/image9.png)

---

### 11. **Avg Rating by Fat Content**

This query calculates the average rating of items, grouped by fat content.

**Output:**

![Avg Rating by Fat Content](path/to/your/image10.png)

---

## Data Visualizations

For the visual analysis, tools such as **Power BI**, **Excel**, and **Python (matplotlib / seaborn)** were used to generate interactive and dynamic reports. The following visualizations were created:

- **Sales Trend Over Time**
- **Heatmaps for Visibility and Sales**
- **Bar Graphs for Item Type and Fat Content Sales**

### Example Visualizations

1. **Sales Trend Over Time**  
   Shows how total sales evolve over the years by Outlet Establishment Year.  
   ![Sales Trend](path/to/your/sales_trend.gif)

2. **Sales by Item Type**  
   A bar chart showcasing sales by item type.  
   ![Item Type Sales](path/to/your/item_type_sales.png)

---

## Data Analysis Insights

1. **Sales Patterns:**
   - The sales are heavily driven by certain `Item_Fat_Content` and `Item_Type` categories, with "Regular" fat content products seeing higher sales.

2. **Top Performing Outlets:**
   - Outlets established after 2005 tend to have the highest total sales, possibly due to newer or more optimized business strategies.

3. **Item Visibility:**
   - Outlets with higher or lower than average item visibility need targeted adjustments to improve product placement.

4. **Avg Rating by Fat Content:**
   - The ratings are generally higher for "Low Fat" items compared to "Regular" items, indicating a potential preference for healthier options.

---

## Future Enhancements

- **Prediction Modeling:** Using machine learning to predict total sales based on historical data.
- **Improved Item Categorization:** Further segmentation of items into more granular categories to detect niche patterns.

---

## Conclusion

This analysis provides a comprehensive understanding of grocery sales patterns, identifying key factors like item type, outlet size, and item visibility. By leveraging these insights, Blinkit can make informed decisions to optimize inventory, marketing strategies, and sales forecasting.

---

**Note:**  
Replace the `path/to/your/imageX.png` with actual paths to the images you generate from your queries or visualizations. You can use tools like Power BI, Python (matplotlib, seaborn), or Excel for generating visual outputs and animations.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
