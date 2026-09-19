# Student Budget Online Shopping System

## Project Overview

The Student Budget Online Shopping System is a Database Management System designed to organize student information, budgets, products, shopping activities, orders, payments, wishlists and feedback in a structured relational database.

The system maintains related records using Primary Keys and Foreign Keys and supports efficient management of student budget and shopping information.

## Problem Statement

Students often face difficulty in managing limited budgets while purchasing essential items.

When prices, quantities and purchase records are tracked manually, it becomes difficult to monitor total expenditure, compare planned and actual spending, and maintain accurate records.

Therefore, a centralized relational database is developed to organize student, budget, product, cart, order, payment, wishlist and feedback information.

## Objectives

- Maintain structured student and budget information.
- Manage products and product categories.
- Connect related records using Primary Keys and Foreign Keys.
- Manage carts, orders and order items.
- Maintain payment information.
- Support wishlist and product feedback management.
- Maintain accurate and consistent data using constraints.
- Demonstrate DBMS concepts through SQL operations.

## Entities

The system contains 11 main entities:

1. Student
2. Category
3. Product
4. Budget
5. Cart
6. Cart Item
7. Order Details
8. Order Item
9. Payment
10. Wishlist
11. Feedback

## Database Technologies

- Database: MySQL
- Database Management Tool: MySQL Workbench
- Query Language: SQL
- Version Control: GitHub
- Development Environment: Visual Studio Code

## Database Operations

The project demonstrates:

- DDL – CREATE, ALTER
- DML – INSERT, UPDATE, DELETE
- DQL – SELECT
- CRUD Operations
- JOIN Operations
- Aggregate Functions
- GROUP BY
- HAVING
- Subqueries
- Views
- Primary Key constraints
- Foreign Key constraints
- NOT NULL constraints
- UNIQUE constraints
- CHECK constraints
- DEFAULT values

## Database Structure

```text
Student
   |
   ├── Budget
   ├── Cart
   ├── Order Details
   ├── Wishlist
   └── Feedback

Category
   |
   └── Product
          |
          ├── Cart Item
          ├── Order Item
          ├── Wishlist
          └── Feedback

Order Details
   |
   ├── Order Item
   └── Payment