-- ============================================
-- STUDENT BUDGET ONLINE SHOPPING SYSTEM
-- DML - Data Manipulation Language
-- ============================================

USE student_budget_shopping;


-- ============================================
-- 1. STUDENT DATA
-- ============================================

-- ============================================
-- 1. STUDENT DATA
-- ============================================

INSERT INTO Student
(Name, Email, Phone_Number, Password, College, Department, Year)
VALUES
('Sravani', 'sravani@gmail.com', '9876543210',
 'sravani123', 'Aditya University', 'AIML', 2),

('Anjali', 'anjali@gmail.com', '9876543211',
 'anjali123', 'Aditya University', 'CSE', 2),

('Rahul', 'rahul@gmail.com', '9876543212',
 'rahul123', 'Aditya University', 'CSE', 2),

('Kiran', 'kiran@gmail.com', '9876543213',
 'kiran123', 'Aditya University', 'ECE', 2);

-- ============================================
-- 2. CATEGORY DATA
-- ============================================

INSERT INTO Category
(Category_Name, Description)
VALUES
('Stationery', 'Books, pens and other study materials'),
('Electronics', 'Useful electronic products for students'),
('Books', 'Academic and reference books'),
('Accessories', 'Useful student accessories'),
('Daily Essentials', 'Daily-use student products');


-- ============================================
-- 3. PRODUCT DATA
-- ============================================

INSERT INTO Product
(Product_Name, Category_ID, Price, Stock)
VALUES
('Notebook', 1, 50.00, 100),
('Pen Pack', 1, 30.00, 200),
('Scientific Calculator', 2, 650.00, 30),
('USB Flash Drive', 2, 450.00, 50),
('Programming in C++', 3, 350.00, 40),
('Data Structures Book', 3, 400.00, 35),
('College Backpack', 4, 800.00, 25),
('Water Bottle', 5, 250.00, 60),
('Lunch Box', 5, 300.00, 40),
('Headphones', 2, 700.00, 20);


-- ============================================
-- 4. BUDGET DATA
-- ============================================

INSERT INTO Budget
(Student_ID, Budget_Amount, Start_Date, End_Date)
VALUES
(1, 3000.00, '2026-09-01', '2026-09-30'),
(2, 2500.00, '2026-09-01', '2026-09-30'),
(3, 4000.00, '2026-09-01', '2026-09-30'),
(4, 2000.00, '2026-09-01', '2026-09-30');


-- ============================================
-- 5. CART DATA
-- ============================================

INSERT INTO Cart
(Student_ID)
VALUES
(1),
(2),
(3),
(4);


-- ============================================
-- 6. CART ITEM DATA
-- ============================================

INSERT INTO Cart_Item
(Cart_ID, Product_ID, Quantity)
VALUES
(1, 1, 2),
(1, 5, 1),
(2, 2, 3),
(2, 8, 1),
(3, 6, 1),
(4, 7, 1);


-- ============================================
-- 7. ORDER DATA
-- ============================================

INSERT INTO Order_Details
(Student_ID, Total_Amount, Order_Status)
VALUES
(1, 450.00, 'Confirmed'),
(2, 340.00, 'Pending'),
(3, 400.00, 'Delivered');


-- ============================================
-- 8. ORDER ITEM DATA
-- ============================================

INSERT INTO Order_Item
(Order_ID, Product_ID, Quantity, Price)
VALUES
(1, 1, 2, 50.00),
(1, 5, 1, 350.00),
(2, 2, 3, 30.00),
(2, 8, 1, 250.00),
(3, 6, 1, 400.00);




-- ============================================
-- 9. PAYMENT DATA
-- ============================================

INSERT INTO Payment
(Order_ID, Payment_Method, Payment_Status, Amount)
VALUES
(1, 'UPI', 'Paid', 450.00),
(2, 'Cash on Delivery', 'Pending', 340.00),
(3, 'UPI', 'Paid', 400.00);

-- ============================================
-- 10. WISHLIST DATA
-- ============================================

INSERT INTO Wishlist
(Student_ID, Product_ID)
VALUES
(1, 3),
(1, 10),
(2, 7),
(3, 4);


-- ============================================
-- 11. FEEDBACK DATA
-- ============================================

INSERT INTO Feedback
(Student_ID, Product_ID, Rating, Comment)
VALUES
(1, 1, 5, 'Good quality notebook'),
(1, 5, 4, 'Useful programming book'),
(2, 8, 5, 'Good water bottle'),
(3, 6, 4, 'Very useful for students');