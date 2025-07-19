-- STEP 1: Select the Database and Show All Tables
USE sales_data_project;
SHOW TABLES;

-- STEP 2: View Entire Table and Count Total Rows
SELECT * FROM SUPERSTORE;
SELECT COUNT(*) AS Total_Rows FROM SUPERSTORE;

-- STEP 3: View All Unique Product Names
SELECT DISTINCT `Product Name` AS Unique_Products
FROM SUPERSTORE;

-- STEP 4: Total Sales of Each Product
SELECT `Product Name`, 
       SUM(Sales) AS Total_Sales
FROM SUPERSTORE
GROUP BY `Product Name`
ORDER BY Total_Sales DESC;

-- STEP 5: Most Sold Products by Quantity
SELECT `Product Name`, 
       SUM(Quantity) AS Total_Quantity_Sold
FROM SUPERSTORE
GROUP BY `Product Name`
ORDER BY Total_Quantity_Sold DESC;

-- STEP 6: Total Sales and Profit for Each Product
SELECT `Product Name`, 
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM SUPERSTORE
GROUP BY `Product Name`
ORDER BY Total_Profit DESC;

-- STEP 7: Products with High Sales but Low Profit
SELECT `Product Name`, 
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM SUPERSTORE
GROUP BY `Product Name`
HAVING Total_Sales > 1000 AND Total_Profit < 0
ORDER BY Total_Profit;

-- STEP 8: Total Sales Grouped by Each Category
SELECT 
  Category,
  SUM(Sales) AS Total_Sales
FROM SUPERSTORE
GROUP BY Category
ORDER BY Total_Sales DESC;

-- STEP 9: State-wise Total Sales and Profit
SELECT `State`, 
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit 
FROM SUPERSTORE 
GROUP BY `State`
ORDER BY Total_Profit DESC;

-- STEP 10: City-wise Total Sales and Profit
SELECT `City`, 
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit 
FROM SUPERSTORE 
GROUP BY `City`
ORDER BY Total_Profit DESC;

-- STEP 11: Monthly Sales and Profit Trend
SELECT 
  DATE_FORMAT(STR_TO_DATE(`Order Date`, '%d-%m-%Y'), '%Y-%m') AS Month_Year,
  SUM(Sales) AS Total_Sales,
  SUM(Profit) AS Total_Profit
FROM SUPERSTORE
WHERE `Order Date` IS NOT NULL
GROUP BY Month_Year
ORDER BY Month_Year;

-- STEP 12: Top 10 Customers by Total Purchase
SELECT `Customer Name`,
       SUM(Sales) AS Total_Sales
FROM SUPERSTORE
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- STEP 13: Ship Mode Impact on Sales
SELECT `Ship Mode`, 
       COUNT(*) AS Total_Orders,
       SUM(Sales) AS Total_Sales
FROM SUPERSTORE
GROUP BY `Ship Mode`
ORDER BY Total_Sales DESC;
