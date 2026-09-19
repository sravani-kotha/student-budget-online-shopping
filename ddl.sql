-- ============================================
-- STUDENT BUDGET ONLINE SHOPPING SYSTEM
-- DDL - Data Definition Language
-- ============================================

CREATE DATABASE IF NOT EXISTS student_budget_shopping;

USE student_budget_shopping;


-- ============================================
-- 1. STUDENT TABLE
-- ============================================

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone_Number VARCHAR(15) UNIQUE,
    Department VARCHAR(100),
    Year INT,
    Password VARCHAR(100) NOT NULL,
    College VARCHAR(150) NOT NULL
);

-- ============================================
-- 2. CATEGORY TABLE
-- ============================================

CREATE TABLE Category (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(100) NOT NULL UNIQUE,
    Description VARCHAR(255)
);


-- ============================================
-- 3. PRODUCT TABLE
-- ============================================

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(150) NOT NULL,
    Category_ID INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    Stock INT NOT NULL DEFAULT 0 CHECK (Stock >= 0),

    FOREIGN KEY (Category_ID)
        REFERENCES Category(Category_ID)
);


-- ============================================
-- 4. BUDGET TABLE
-- ============================================

CREATE TABLE Budget (
    Budget_ID INT PRIMARY KEY AUTO_INCREMENT,
    Student_ID INT NOT NULL,
    Budget_Amount DECIMAL(10,2) NOT NULL
        CHECK (Budget_Amount > 0),
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,

    FOREIGN KEY (Student_ID)
        REFERENCES Student(Student_ID)
);


-- ============================================
-- 5. CART TABLE
-- ============================================

CREATE TABLE Cart (
    Cart_ID INT PRIMARY KEY AUTO_INCREMENT,
    Student_ID INT NOT NULL,
    Created_Date DATE DEFAULT (CURRENT_DATE),

    FOREIGN KEY (Student_ID)
        REFERENCES Student(Student_ID)
);


-- ============================================
-- 6. CART ITEM TABLE
-- ============================================

CREATE TABLE Cart_Item (
    Cart_Item_ID INT PRIMARY KEY AUTO_INCREMENT,
    Cart_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),

    FOREIGN KEY (Cart_ID)
        REFERENCES Cart(Cart_ID),

    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
);


-- ============================================
-- 7. ORDER DETAILS TABLE
-- ============================================

CREATE TABLE Order_Details (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Student_ID INT NOT NULL,
    Order_Date DATE DEFAULT (CURRENT_DATE),
    Total_Amount DECIMAL(10,2) NOT NULL
        CHECK (Total_Amount >= 0),
    Order_Status VARCHAR(30) DEFAULT 'Pending',

    FOREIGN KEY (Student_ID)
        REFERENCES Student(Student_ID)
);


-- ============================================
-- 8. ORDER ITEM TABLE
-- ============================================

CREATE TABLE Order_Item (
    Order_Item_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),

    FOREIGN KEY (Order_ID)
        REFERENCES Order_Details(Order_ID),

    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
);


-- ============================================
-- 9. PAYMENT TABLE
-- ============================================

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT NOT NULL UNIQUE,
    Payment_Date DATE DEFAULT (CURRENT_DATE),
    Amount DECIMAL(10,2),
    Payment_Method VARCHAR(30) NOT NULL,
    Payment_Status VARCHAR(30) DEFAULT 'Pending',

    FOREIGN KEY (Order_ID)
        REFERENCES Order_Details(Order_ID)
);


-- ============================================
-- 10. WISHLIST TABLE
-- ============================================

CREATE TABLE Wishlist (
    Wishlist_ID INT PRIMARY KEY AUTO_INCREMENT,
    Student_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Added_Date DATE DEFAULT (CURRENT_DATE),

    FOREIGN KEY (Student_ID)
        REFERENCES Student(Student_ID),

    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID),

    UNIQUE (Student_ID, Product_ID)
);


-- ============================================
-- 11. FEEDBACK TABLE
-- ============================================

CREATE TABLE Feedback (
    Feedback_ID INT PRIMARY KEY AUTO_INCREMENT,
    Student_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Comment VARCHAR(500),
    Feedback_Date DATE DEFAULT (CURRENT_DATE),

    FOREIGN KEY (Student_ID)
        REFERENCES Student(Student_ID),

    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
);