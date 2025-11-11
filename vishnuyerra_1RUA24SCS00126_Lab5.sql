-- ======================================================================
-- Lab Experiment 05 - SQL Joins
-- ======================================================================

-- Objective:
-- To understand the concept of SQL joins and their applications in relational databases.
-- To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS Lab05_Joins;
CREATE DATABASE Lab05_Joins;
USE Lab05_Joins;
-- OUTPUT
-- 16:11:17	DROP DATABASE IF EXISTS Lab05_Joins	0 row(s) affected, 1 warning(s): 1008 Can't drop database 'lab05_joins'; database doesn't exist	0.015 sec
-- 16:11:17	CREATE DATABASE Lab05_Joins	1 row(s) affected	0.016 sec
-- 16:11:17	USE Lab05_Joins	0 row(s) affected	0.000 sec


-- Step 2: Create Tables
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);
-- OUTPUT
-- 16:11:17	CREATE TABLE Customers (     customer_id INT PRIMARY KEY,     customer_name VARCHAR(50),     city VARCHAR(50) )	0 row(s) affected	0.047 sec

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
-- OUTPUT
-- 16:11:17	CREATE TABLE Orders (     order_id INT PRIMARY KEY,     customer_id INT,     product_name VARCHAR(50),     order_date DATE,     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) )	0 row(s) affected	0.125 sec

-- Step 3: Insert Sample Data
INSERT INTO Customers (customer_id, customer_name, city) VALUES
(1, 'A', 'Bangalore'),
(2, 'B', 'Delhi'),
(3, 'C', 'Mumbai'),
(4, 'D', 'Chennai');

INSERT INTO Orders (order_id, customer_id, product_name, order_date) VALUES
(101, 1, 'Laptop', '2023-12-15'),
(102, 2, 'Smartphone', '2024-01-10'),
(103, 1, 'Headphones', '2024-02-20'),
(104, 3, 'Tablet', '2024-03-05');

SELECT * FROM Customers;
SELECT * FROM Orders;
-- OUTPUT
-- 16:11:17	INSERT INTO Customers (customer_id, customer_name, city) VALUES (1, 'A', 'Bangalore'), (2, 'B', 'Delhi'), (3, 'C', 'Mumbai'), (4, 'D', 'Chennai')	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.015 sec
-- 16:11:17	INSERT INTO Orders (order_id, customer_id, product_name, order_date) VALUES (101, 1, 'Laptop', '2023-12-15'), (102, 2, 'Smartphone', '2024-01-10'), (103, 1, 'Headphones', '2024-02-20'), (104, 3, 'Tablet', '2024-03-05')	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.016 sec
-- 16:11:17	SELECT * FROM Customers LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
-- 16:11:17	SELECT * FROM Orders LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
-- ======================================================================
-- LAB TASKS
-- ======================================================================

-- 1. INNER JOIN
SELECT 
    Customers.customer_id, 
    Customers.customer_name, 
    Customers.city, 
    Orders.order_id, 
    Orders.product_name, 
    Orders.order_date
FROM Customers
INNER JOIN Orders 
ON Customers.customer_id = Orders.customer_id
WHERE Customers.city = 'Bangalore';
-- OUTPUT
-- 16:11:18	SELECT      Customers.customer_id,      Customers.customer_name,      Customers.city,      Orders.order_id,      Orders.product_name,      Orders.order_date FROM Customers INNER JOIN Orders  ON Customers.customer_id = Orders.customer_id WHERE Customers.city = 'Bangalore' LIMIT 0, 1000	2 row(s) returned	0.016 sec / 0.000 sec

-- 2. LEFT OUTER JOIN
SELECT 
    Customers.customer_id, 
    Customers.customer_name, 
    Orders.order_id, 
    Orders.product_name, 
    Orders.order_date
FROM Customers
LEFT JOIN Orders 
ON Customers.customer_id = Orders.customer_id;

-- OUTPUT
-- 16:11:18	SELECT      Customers.customer_id,      Customers.customer_name,      Orders.order_id,      Orders.product_name,      Orders.order_date FROM Customers LEFT JOIN Orders  ON Customers.customer_id = Orders.customer_id LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec

-- 3. RIGHT OUTER JOIN
SELECT 
    Orders.order_id, 
    Orders.product_name, 
    Orders.order_date, 
    Customers.customer_id, 
    Customers.customer_name
FROM Orders
RIGHT JOIN Customers 
ON Orders.customer_id = Customers.customer_id;
INSERT INTO Orders (order_id, customer_id, product_name, order_date) 
VALUES (105, NULL, 'Camera', '2024-04-01');

-- OUTPUT
-- 16:11:18	SELECT      Orders.order_id,      Orders.product_name,      Orders.order_date,      Customers.customer_id,      Customers.customer_name FROM Orders RIGHT JOIN Customers  ON Orders.customer_id = Customers.customer_id LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec
-- 16:11:18	INSERT INTO Orders (order_id, customer_id, product_name, order_date)  VALUES (105, NULL, 'Camera', '2024-04-01')	1 row(s) affected	0.016 sec

-- 4. FULL OUTER JOIN
SELECT 
    Customers.customer_id, 
    Customers.customer_name, 
    Orders.order_id, 
    Orders.product_name, 
    Orders.order_date
FROM Customers
LEFT JOIN Orders 
ON Customers.customer_id = Orders.customer_id

UNION

SELECT 
    Customers.customer_id, 
    Customers.customer_name, 
    Orders.order_id, 
    Orders.product_name, 
    Orders.order_date
FROM Customers
RIGHT JOIN Orders 
ON Customers.customer_id = Orders.customer_id;

-- OUTPUT
-- 16:11:18	SELECT      Customers.customer_id,      Customers.customer_name,      Orders.order_id,      Orders.product_name,      Orders.order_date FROM Customers LEFT JOIN Orders  ON Customers.customer_id = Orders.customer_id  UNION  SELECT      Customers.customer_id,      Customers.customer_name,      Orders.order_id,      Orders.product_name,      Orders.order_date FROM Customers RIGHT JOIN Orders  ON Customers.customer_id = Orders.customer_id	6 row(s) returned	0.000 sec / 0.000 sec

-- 5. NATURAL JOIN

SELECT *
FROM Customers
NATURAL JOIN Orders;

-- OUTPUT
-- 16:11:18	SELECT * FROM Customers NATURAL JOIN Orders LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
