CREATE TABLE RetailedTransactions (
    TransactionID VARCHAR(10),
    Date DATE,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Region VARCHAR(50),
    Saleschannel VARCHAR(50),
    UnitPrice DECIMAL(10, 2),
    TotalAmount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    CustomerID VARCHAR(10)      
);


SELECT Region, SUM(TotalAmount) AS TotalSales
FROM RetailTransactions
WHERE Date BETWEEN '2025-01-01' AND '2025-03-31'
GROUP BY Region;

SELECT ProductName, SUM(TotalAmount) AS Revenue
FROM RetailTransactions
GROUP BY ProductName
ORDER BY Revenue DESC
LIMIT 5;

SELECT 
    MONTH(Date) AS Month,
    SUM(TotalAmount) AS MonthlySales
FROM RetailTransactions
GROUP BY MONTH(Date)
ORDER BY Month;

SELECT 
    Region,
    SUM(TotalAmount) AS Sales,
    ROUND(SUM(TotalAmount) * 100.0 / 
        (SELECT SUM(TotalAmount) FROM RetailTransactions), 2) AS Percentage
FROM RetailTransactions
GROUP BY Region;

SELECT 
    SalesChannel,
    MONTH(Date) AS Month,
    SUM(TotalAmount) AS Sales
FROM RetailTransactions
GROUP BY SalesChannel, MONTH(Date)
ORDER BY Month;

SELECT 
    Category,
    MONTH(Date) AS Month,
    SUM(TotalAmount) AS Sales
FROM RetailTransactions
GROUP BY Category, MONTH(Date)
ORDER BY Category, Month;

SELECT CustomerID, COUNT(*) AS TotalOrders
FROM RetailTransactions
GROUP BY CustomerID
HAVING COUNT(*) > 10;