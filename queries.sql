-- ============================================
-- STUDENT BUDGET ONLINE SHOPPING SYSTEM
-- SQL QUERIES
-- ============================================

USE student_budget_shopping;


-- ============================================
-- 1. INSERT
-- ============================================

INSERT INTO Product
(Product_Name, Category_ID, Price, Stock)
VALUES
('Laptop Stand', 4, 600.00, 15);


-- ============================================
-- 2. SELECT / READ
-- Products with price below 500
-- ============================================

SELECT Product_ID, Product_Name, Price, Stock
FROM Product
WHERE Price < 500;


-- ============================================
-- 3. UPDATE
-- Update stock using Primary Key
-- ============================================

UPDATE Product
SET Stock = 25
WHERE Product_ID = 11;


-- ============================================
-- 4. DELETE
-- Temporary record demonstration
-- ============================================

INSERT INTO Product
(Product_Name, Category_ID, Price, Stock)
VALUES
('Temporary Product', 1, 10.00, 5);

SELECT *
FROM Product
WHERE Product_Name = 'Temporary Product';

DELETE FROM Product
WHERE Product_ID = (
    SELECT Product_ID
    FROM (
        SELECT Product_ID
        FROM Product
        WHERE Product_Name = 'Temporary Product'
    ) AS temp
);

SELECT *
FROM Product
WHERE Product_Name = 'Temporary Product';


-- ============================================
-- 5. INNER JOIN
-- Product and Category
-- ============================================

SELECT
    p.Product_ID,
    p.Product_Name,
    c.Category_Name,
    p.Price,
    p.Stock
FROM Product p
JOIN Category c
ON p.Category_ID = c.Category_ID;


-- ============================================
-- 6. COUNT
-- Total number of products
-- ============================================

SELECT COUNT(*) AS Total_Products
FROM Product;


-- ============================================
-- 7. SUM
-- Total stock
-- ============================================

SELECT SUM(Stock) AS Total_Stock
FROM Product;


-- ============================================
-- 8. AVG
-- Average product price
-- ============================================

SELECT AVG(Price) AS Average_Price
FROM Product;


-- ============================================
-- 9. MAX
-- Highest product price
-- ============================================

SELECT MAX(Price) AS Highest_Price
FROM Product;


-- ============================================
-- 10. MIN
-- Lowest product price
-- ============================================

SELECT MIN(Price) AS Lowest_Price
FROM Product;


-- ============================================
-- 11. GROUP BY
-- Number of products in each category
-- ============================================

SELECT
    c.Category_Name,
    COUNT(p.Product_ID) AS Number_Of_Products
FROM Category c
JOIN Product p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_ID, c.Category_Name;


-- ============================================
-- 12. HAVING
-- Categories having more than 1 product
-- ============================================

SELECT
    c.Category_Name,
    COUNT(p.Product_ID) AS Number_Of_Products
FROM Category c
JOIN Product p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_ID, c.Category_Name
HAVING COUNT(p.Product_ID) > 1;


-- ============================================
-- 13. SUBQUERY
-- Products above average price
-- ============================================

SELECT Product_Name, Price
FROM Product
WHERE Price > (
    SELECT AVG(Price)
    FROM Product
);


-- ============================================
-- 14. SUBQUERY
-- Budgets above average budget
-- ============================================

SELECT Student_ID, Budget_Amount
FROM Budget
WHERE Budget_Amount > (
    SELECT AVG(Budget_Amount)
    FROM Budget
);


-- ============================================
-- 15. CREATE VIEW
-- ============================================

CREATE VIEW Product_Category_View AS
SELECT
    p.Product_ID,
    p.Product_Name,
    c.Category_Name,
    p.Price,
    p.Stock
FROM Product p
JOIN Category c
ON p.Category_ID = c.Category_ID;


-- ============================================
-- 16. DISPLAY VIEW
-- ============================================

SELECT *
FROM Product_Category_View;


-- ============================================
-- 17. QUERY VIEW
-- Products below 500
-- ============================================

SELECT *
FROM Product_Category_View
WHERE Price < 500;