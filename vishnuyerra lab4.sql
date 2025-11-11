
-- ======================================================================
-- Lab Experiment 04 – Implementation of Different Types of Operators in SQL
-- ======================================================================

-- Step 1: Create Database
DROP DATABASE IF EXISTS OperatorLab;
CREATE DATABASE OperatorLab;
USE OperatorLab;

/* 1	52	15:29:01	DROP DATABASE IF EXISTS OperatorLab	0 row(s) affected, 1 warning(s):
 1008 Can't drop database 'operatorlab'; database doesn't exist	0.015 sec
3	53	15:29:01	CREATE DATABASE OperatorLab	1 row(s) affected	0.000 sec
3	54	15:29:01	USE OperatorLab	0 row(s) affected	0.000 sec */

-- Step 2: Create Tables
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100)
);

/* 3	55	15:29:31	CREATE TABLE Employees (
     EmployeeID INT PRIMARY KEY,
     Name VARCHAR(50),
     Age INT,
     Salary DECIMAL(10, 2),
     Department VARCHAR(50),
     HireDate DATE,
     Address VARCHAR(100)
 )	0 row(s) affected	0.047 sec */

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
/* 3	56	15:30:01	CREATE TABLE Departments (
     DepartmentID INT PRIMARY KEY,
     DepartmentName VARCHAR(50),
     EmployeeID INT,
     FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
 )	0 row(s) affected	0.047 sec */

-- Step 3: Insert Sample Data
INSERT INTO Employees (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES
(1001, 'Ashish', 28, 60000, 'IT', '2024-05-01', '123 Main St, New York'),
(1002, 'Binay', 45, 80000, 'HR', '2020-07-15', '456 Elm St, Chicago'),
(1003, 'Charlie', 32, 55000, 'Finance', '2022-01-10', '789 Oak St, Los Angeles'),
(1004, 'Dhruv', 38, 75000, 'HR', '2021-10-30', '101 Pine St, New York');

/* 3	57	15:30:25	INSERT INTO Employees (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES
 (1001, 'Ashish', 28, 60000, 'IT', '2024-05-01', '123 Main St, New York'),
 (1002, 'Binay', 45, 80000, 'HR', '2020-07-15', '456 Elm St, Chicago'),
 (1003, 'Charlie', 32, 55000, 'Finance', '2022-01-10', '789 Oak St, Los Angeles'),
 (1004, 'Dhruv', 38, 75000, 'HR', '2021-10-30', '101 Pine St, New York')	4 row(s) affected
 Records: 4  Duplicates: 0  Warnings: 0	0.016 sec */

INSERT INTO Departments (DepartmentID, DepartmentName, EmployeeID) VALUES
(1, 'IT', 1001),
(2, 'HR', 1002),
(3, 'Finance', 1003);
/* 3	58	15:30:51	INSERT INTO Departments (DepartmentID, DepartmentName, EmployeeID) VALUES
 (1, 'IT', 1001),
 (2, 'HR', 1002),
 (3, 'Finance', 1003)	3 row(s) affected
 Records: 3  Duplicates: 0  Warnings: 0	0.032 sec */

SELECT * FROM Employees;
SELECT * FROM Departments;

/* 3	59	15:31:16	SELECT * FROM Employees
 LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec
3	60	15:31:16	SELECT * FROM Departments
 LIMIT 0, 1000	3 row(s) returned	0.000 sec / 0.000 sec */
 
-- ======================================================================
-- PRACTICE TASKS
-- ======================================================================

-- ========================
-- Exercise 1: Arithmetic Operators
-- ========================

-- a. Add a bonus (10% of Salary) to each employee's salary.
-- WRITE YOUR QUERY BELOW
SELECT Name, Salary, Salary * 0.10 AS Bonus, Salary + (Salary * 0.10) AS New_Salary
FROM Employees;

/* 3	61	15:31:59	SELECT Name, Salary, Salary * 0.10 AS Bonus, Salary + (Salary * 0.10) AS New_Salary
 FROM Employees
 LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec */

-- b. Subtract tax (15% of Salary) from each employee's salary.
-- WRITE YOUR QUERY BELOW
SELECT Name, Salary, Salary * 0.15 AS Tax, Salary - (Salary * 0.15) AS Salary_After_Tax
FROM Employees;

/* 3	62	15:32:17	SELECT Name, Salary, Salary * 0.15 AS Tax, Salary - (Salary * 0.15) AS Salary_After_Tax
 FROM Employees
 LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec */

-- c. Calculate the yearly salary from the monthly salary (Salary * 12).
-- WRITE YOUR QUERY BELOW
SELECT Name, Salary, Salary * 12 AS Yearly_Salary
FROM Employees;

/* 3	63	15:32:39	SELECT Name, Salary, Salary * 12 AS Yearly_Salary
 FROM Employees
 LIMIT 0, 1000	4 row(s) returned	0.016 sec / 0.000 sec */

-- d. Find the remainder when employees' ages are divided by 5.
-- WRITE YOUR QUERY BELOW
SELECT Name, Age, Age % 5 AS Remainder
FROM Employees;

/* 3	64	15:32:58	SELECT Name, Age, Age % 5 AS Remainder
 FROM Employees
 LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec */


-- ========================
-- Exercise 2: Logical Operators
-- ========================

-- a. Employees older than 30 and salary greater than 50000.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Age > 30 AND Salary > 50000;

/* 3	65	15:33:34	SELECT * FROM Employees
 WHERE Age > 30 AND Salary > 50000
 LIMIT 0, 1000	3 row(s) returned	0.015 sec / 0.000 sec */

-- b. Employees either in 'HR' department OR salary > 70000.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Department = 'HR' OR Salary > 70000;

/* 3	66	15:33:51	SELECT * FROM Employees
 WHERE Department = 'HR' OR Salary > 70000
 LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec */

-- c. Employees who do NOT live in 'New York'.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Address NOT LIKE '%New York%';

/* 3	67	15:34:08	SELECT * FROM Employees
 WHERE Address NOT LIKE '%New York%'
 LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec */

-- ========================
-- Exercise 3: Comparison Operators
-- ========================

-- a. Find employees with salary = 60000.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Salary = 60000;

/* 3	68	15:37:09	SELECT * FROM Employees
 WHERE Salary = 60000
 LIMIT 0, 1000	1 row(s) returned	0.016 sec / 0.000 sec */
 
-- b. List employees not in the 'IT' department.
-- WRITE YOUR QUERY BELOW
SELECT *
FROM Employees
WHERE Department <> 'IT';

/* 3	69	15:37:28	SELECT *
 FROM Employees
 WHERE Department <> 'IT'
 LIMIT 0, 1000	3 row(s) returned	0.000 sec / 0.000 sec */

-- c. Retrieve employees younger than 25 with salary > 50000.
-- WRITE YOUR QUERY BELOW

SELECT * FROM Employees
WHERE Age < 25 AND Salary > 50000;

/* 3	70	15:37:45	SELECT * FROM Employees
 WHERE Age < 25 AND Salary > 50000
 LIMIT 0, 1000	0 row(s) returned	0.000 sec / 0.000 sec */
 
-- ========================
-- Exercise 4: Special Operators
-- ========================

-- a. BETWEEN → List employees with age between 25 and 35.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Age BETWEEN 25 AND 35;

/* 3	71	15:38:03	SELECT * FROM Employees
 WHERE Age BETWEEN 25 AND 35
 LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec */

-- b. IN → Find employees working in 'HR', 'IT', or 'Finance'.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Department IN ('HR', 'IT', 'Finance');

/* 3	72	15:38:20	SELECT * FROM Employees
 WHERE Department IN ('HR', 'IT', 'Finance')
 LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec */

-- c. LIKE → Find employees whose names start with 'A'.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Name LIKE 'A%';

/* 3	73	15:38:37	SELECT * FROM Employees
 WHERE Name LIKE 'A%'
 LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec */

-- d. IS NULL → List employees whose address is not available.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Address IS NULL;

/* 3	74	15:38:54	SELECT * FROM Employees
 WHERE Address IS NULL
 LIMIT 0, 1000	0 row(s) returned	0.000 sec / 0.000 sec */


-- ========================
-- Exercise 5: Set Operators
-- ========================

-- NOTE: For these, assume you have two Employee tables (Employees2022 and Employees2023).

-- a. UNION → Retrieve employees from 'HR' department in 2023 and 2022.
-- WRITE YOUR QUERY BELOW
CREATE TABLE Employees2022 AS
SELECT EmployeeID, Name, Department FROM Employees;

/* 3	75	15:39:13	CREATE TABLE Employees2022 AS
 SELECT EmployeeID, Name, Department FROM Employees	4 row(s) affected
 Records: 4  Duplicates: 0  Warnings: 0	0.047 sec */
 
CREATE TABLE Employees2023 AS
SELECT EmployeeID, Name, Department FROM Employees
WHERE EmployeeID IN (1001, 1002, 1003, 1005);

/* 3	76	15:39:29	CREATE TABLE Employees2023 AS
 SELECT EmployeeID, Name, Department FROM Employees
 WHERE EmployeeID IN (1001, 1002, 1003, 1005)	3 row(s) affected
 Records: 3  Duplicates: 0  Warnings: 0	0.047 sec */

-- b. INTERSECT → Find common employees in 'IT' department across 2022 & 2023.
-- (MySQL doesn’t have INTERSECT directly – use INNER JOIN / EXISTS workaround)
-- WRITE YOUR QUERY BELOW
SELECT Name, Department FROM Employees2022 WHERE Department = 'HR'
UNION
SELECT Name, Department FROM Employees2023 WHERE Department = 'HR';

/* 3	77	15:39:45	SELECT Name, Department FROM Employees2022 WHERE Department = 'HR'
 UNION
 SELECT Name, Department FROM Employees2023 WHERE Department = 'HR'	2 row(s) returned	0.000 sec / 0.000 sec */

-- c. EXCEPT → Find employees who worked in 2023 but not in 2022.
-- (MySQL doesn’t have EXCEPT directly – use LEFT JOIN / NOT EXISTS workaround)
-- WRITE YOUR QUERY BELOW
SELECT e22.Name, e22.Department
FROM Employees2022 e22
INNER JOIN Employees2023 e23
ON e22.EmployeeID = e23.EmployeeID
WHERE e22.Department = 'IT';

/* 3	78	15:40:02	SELECT e22.Name, e22.Department
 FROM Employees2022 e22
 INNER JOIN Employees2023 e23
 ON e22.EmployeeID = e23.EmployeeID
 WHERE e22.Department = 'IT'
 LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec */

-- ======================================================================
-- END OF EXPERIMENT 04
-- ======================================================================
