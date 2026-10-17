-- SALES & OPERATIONS MIS PROJECT

-- 1. Select database
SELECT DATABASE();

-- 2. View all tables
SHOW TABLES;

-- 3. View customer data
SELECT * FROM customers;

-- 4. View product data
SELECT * FROM products;

-- 5. View order data
SELECT * FROM orders;

-- 6. View target data
SELECT * FROM target;

-- 7. Check customers table structure
DESCRIBE customers;

-- 8. Check products table structure
DESCRIBE products;

-- 9. Check orders table structure
DESCRIBE orders;

-- 10. Check target table structure
DESCRIBE target;

-- 11. Count customers
SELECT COUNT(*) FROM customers;

-- 12. Count products
SELECT COUNT(*) FROM products;

-- 13. Count sales transactions
SELECT COUNT(*) FROM orders;

-- 14. Count target records
SELECT COUNT(*) FROM target;

-- 15. Check sales date range
SELECT MIN(OrderDate), MAX(OrderDate)
FROM orders;

-- 16. Check duplicate customer IDs
SELECT CustomerID, COUNT(*)
FROM customers
GROUP BY CustomerID
HAVING COUNT(*) > 1;

-- 17. Check duplicate product IDs
SELECT ProductID, COUNT(*)
FROM products
GROUP BY ProductID
HAVING COUNT(*) > 1;

-- 18. Check duplicate sales IDs
SELECT SalesID, COUNT(*)
FROM orders
GROUP BY SalesID
HAVING COUNT(*) > 1;

-- 19. Check missing customer records in orders
SELECT o.CustomerID
FROM orders o
LEFT JOIN customers c
ON o.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;

-- 20. Check missing product records in orders
SELECT o.ProductID
FROM orders o
LEFT JOIN products p
ON o.ProductID = p.ProductID
WHERE p.ProductID IS NULL;

-- 21. Overall business performance
SELECT SUM(SalesAmount) AS Total_Sales,
       SUM(CostAmount) AS Total_Cost,
       SUM(Profit) AS Total_Profit
FROM orders;

-- 22. Calculate overall profit margin
SELECT SUM(Profit)/SUM(SalesAmount)*100 AS Profit_Margin
FROM orders;

-- 23. Calculate average transaction value
SELECT SUM(SalesAmount)/COUNT(*) AS Average_Transaction_Value
FROM orders;

-- 24. Calculate total quantity sold
SELECT SUM(Quantity) AS Total_Quantity_Sold
FROM orders;

-- 25. Monthly sales and profit performance
SELECT Year, Month,
       SUM(SalesAmount) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Year, Month
ORDER BY Year, Month;

-- 26. Monthly target achievement
SELECT o.Year, o.Month,
       SUM(o.SalesAmount) AS Actual_Sales,
       MAX(t.Targetamount) AS Target_Amount
FROM orders o
JOIN target t
ON o.Year = t.Year
AND o.Month = t.Month
GROUP BY o.Year, o.Month
ORDER BY o.Year, o.Month;

-- 27. Calculate monthly target achievement percentage
SELECT o.Year, o.Month,
       SUM(o.SalesAmount)/MAX(t.Targetamount)*100 AS Achievement_Percentage
FROM orders o
JOIN target t
ON o.Year = t.Year
AND o.Month = t.Month
GROUP BY o.Year, o.Month
ORDER BY o.Year, o.Month;

-- 28. Regional sales and profit performance
SELECT c.Region,
       SUM(o.SalesAmount) AS Total_Sales,
       SUM(o.Profit) AS Total_Profit,
       SUM(o.Profit)/SUM(o.SalesAmount)*100 AS Profit_Margin
FROM orders o
JOIN customers c
ON o.CustomerID = c.CustomerID
GROUP BY c.Region
ORDER BY Total_Sales DESC;

-- 29. State-wise sales and profit performance
SELECT c.State,
       SUM(o.SalesAmount) AS Total_Sales,
       SUM(o.Profit) AS Total_Profit
FROM orders o
JOIN customers c
ON o.CustomerID = c.CustomerID
GROUP BY c.State
ORDER BY Total_Sales DESC;

-- 30. Customer-wise sales and profit performance
SELECT c.CustomerID, c.CustomerName,
       SUM(o.SalesAmount) AS Total_Sales,
       SUM(o.Profit) AS Total_Profit,
       SUM(o.Profit)/SUM(o.SalesAmount)*100 AS Profit_Margin
FROM orders o
JOIN customers c
ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY Total_Sales DESC;

-- 31. Top 5 customers by sales
SELECT c.CustomerID, c.CustomerName,
       SUM(o.SalesAmount) AS Total_Sales
FROM orders o
JOIN customers c
ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY Total_Sales DESC
LIMIT 5;

-- 32. Category-wise sales and profit performance
SELECT p.Category,
       SUM(o.SalesAmount) AS Total_Sales,
       SUM(o.Profit) AS Total_Profit,
       SUM(o.Profit)/SUM(o.SalesAmount)*100 AS Profit_Margin
FROM orders o
JOIN products p
ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Total_Sales DESC;

-- 33. Subcategory-wise sales and profit performance
SELECT p.Category, p.SubCategory,
       SUM(o.SalesAmount) AS Total_Sales,
       SUM(o.Profit) AS Total_Profit
FROM orders o
JOIN products p
ON o.ProductID = p.ProductID
GROUP BY p.Category, p.SubCategory
ORDER BY Total_Sales DESC;

-- 34. Product-wise sales and profit performance
SELECT p.ProductID, p.ProductName,
       SUM(o.SalesAmount) AS Total_Sales,
       SUM(o.Profit) AS Total_Profit
FROM orders o
JOIN products p
ON o.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY Total_Sales DESC;