
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: vishnuyerra
-- USN: 1RUA24SCS00126
-- SECTION: B 
-- -----------------------------------------------------------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS TechSolutionsLab;
CREATE DATABASE TechSolutionsLab;
USE TechSolutionsLab;

/* 1	28	15:15:26	DROP DATABASE IF EXISTS TechSolutionsLab	0 row(s) affected, 1 warning(s):
 1008 Can't drop database 'techsolutionslab'; database doesn't exist	0.015 sec
3	29	15:15:26	CREATE DATABASE TechSolutionsLab	1 row(s) affected	0.016 sec
3	30	15:15:26	USE TechSolutionsLab	0 row(s) affected	0.000 sec */

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
       
-- Paste the Output below by execution of above command

/* 3	31	15:17:11	SELECT USER(), 
        @@hostname AS Host_Name, 
        VERSION() AS MySQL_Version, 
        NOW() AS Current_Date_Time
 LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec */
 
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2),
    BirthDate DATE,
    HireDate DATE
);

/* 3	32	15:17:54	CREATE TABLE Employees (
     EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
     FirstName VARCHAR(50),
     LastName VARCHAR(50),
     Salary DECIMAL(10, 2),
     BirthDate DATE,
     HireDate DATE
 )	0 row(s) affected	0.031 sec */
 
INSERT INTO Employees (FirstName, LastName, Salary, BirthDate, HireDate) VALUES
('John', 'Doe', 55000.30, '1985-06-15', '2010-01-20'),
('Jane', 'Smith', 65000.50, '1990-08-22', '2012-07-10'),
('Alice', 'Johnson', 72000.10, '1982-11-30', '2015-05-25'),
('Bob', 'Brown', 48000.90, '1978-03-12', '2018-09-15');

/* 3	33	15:18:14	INSERT INTO Employees (FirstName, LastName, Salary, BirthDate, HireDate) VALUES
 ('John', 'Doe', 55000.30, '1985-06-15', '2010-01-20'),
 ('Jane', 'Smith', 65000.50, '1990-08-22', '2012-07-10'),
 ('Alice', 'Johnson', 72000.10, '1982-11-30', '2015-05-25'),
 ('Bob', 'Brown', 48000.90, '1978-03-12', '2018-09-15')	4 row(s) affected
 Records: 4  Duplicates: 0  Warnings: 0	0.031 sec */

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

/* 3	34	15:18:46	CREATE TABLE Orders (
     OrderID INT PRIMARY KEY AUTO_INCREMENT,
     OrderDate DATE,
     TotalAmount DECIMAL(10, 2),
     EmployeeID INT,
     FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
 )	0 row(s) affected	0.078 sec */
 
INSERT INTO Orders (OrderDate, TotalAmount, EmployeeID) VALUES
('2024-07-15', 250.00, 1),
('2024-08-10', 175.50, 2),
('2024-09-01', 300.00, 3),
('2024-09-10', 450.75, 1),
('2024-08-25', 123.40, 4);

/*3	35	15:19:22	INSERT INTO Orders (OrderDate, TotalAmount, EmployeeID) VALUES
 ('2024-07-15', 250.00, 1),
 ('2024-08-10', 175.50, 2),
 ('2024-09-01', 300.00, 3),
 ('2024-09-10', 450.75, 1),
 ('2024-08-25', 123.40, 4)	5 row(s) affected
 Records: 5  Duplicates: 0  Warnings: 0	0.016 sec */

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.


-- Output: 
SELECT * FROM Employees;
SELECT * FROM Orders;

/* 3	36	15:19:46	SELECT * FROM Employees
 LIMIT 0, 1000	4 row(s) returned	0.016 sec / 0.000 sec
3	37	15:19:46	SELECT * FROM Orders
 LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec */


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */

-- Output: 
SELECT EmployeeID, FirstName, Salary, ROUND(Salary) AS RoundedSalary FROM Employees;
/* 3	38	15:20:13	SELECT EmployeeID, FirstName, Salary, ROUND(Salary) AS RoundedSalary FROM Employees
 LIMIT 0, 1000	4 row(s) returned	0.015 sec / 0.000 sec */
 
/* b. Absolute Values: Show absolute values of salaries */

-- Output: 
SELECT EmployeeID, FirstName, Salary, ABS(Salary) AS AbsoluteSalary FROM Employees;

/* 3	39	15:20:41	SELECT EmployeeID, FirstName, Salary, ABS(Salary) AS AbsoluteSalary FROM Employees
 LIMIT 0, 1000	4 row(s) returned	0.016 sec / 0.000 sec */

/* c. Ceiling Values: Get ceiling values of order amounts */

-- Output: 
SELECT OrderID, TotalAmount, CEIL(TotalAmount) AS CeilingAmount FROM Orders;

/* 3	40	15:21:00	SELECT OrderID, TotalAmount, CEIL(TotalAmount) AS CeilingAmount FROM Orders
 LIMIT 0, 1000	5 row(s) returned	0.016 sec / 0.000 sec */
 
-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */

-- Output: 
SELECT COUNT(*) AS TotalEmployees FROM Employees;

/* 3	41	15:21:24	SELECT COUNT(*) AS TotalEmployees FROM Employees
 LIMIT 0, 1000	1 row(s) returned	0.031 sec / 0.000 sec */

/* b. Sum of Salaries: Calculate total salary expense */

-- Output: 
SELECT SUM(Salary) AS TotalSalaryExpense FROM Employees;

/* 3	41	15:21:24	SELECT COUNT(*) AS TotalEmployees FROM Employees
 LIMIT 0, 1000	1 row(s) returned	0.031 sec / 0.000 sec */
 
/* c. Average Order Amount: Find average order value */

-- Output: 
SELECT AVG(TotalAmount) AS AverageOrderAmount FROM Orders;

/* 3	43	15:22:55	SELECT AVG(TotalAmount) AS AverageOrderAmount FROM Orders
 LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec */

/* d. Max/Min Salary: Find highest and lowest salaries */

-- Output: 
SELECT MAX(Salary) AS HighestSalary, MIN(Salary) AS LowestSalary FROM Employees;

/* 3	44	15:23:13	SELECT MAX(Salary) AS HighestSalary, MIN(Salary) AS LowestSalary FROM Employees
 LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec */

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */

-- Output: 
SELECT EmployeeID, UPPER(FirstName) AS First_Upper, LOWER(LastName) AS Last_Lower FROM Employees;


/* b. Concatenate Names: Create full names */

-- Output: 
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS FullName FROM Employees;

/* 3	45	15:23:46	SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS FullName FROM Employees
 LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec */

/* c. Extract Substring: Get first 3 characters of first names */

-- Output: 
SELECT EmployeeID, FirstName, SUBSTRING(FirstName,1,3) AS Short FROM Employees;
/* 3	46	15:24:04	SELECT EmployeeID, FirstName, SUBSTRING(FirstName,1,3) AS Short FROM Employees
 LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec */

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */

-- Output: 
SELECT CAST('2024-07-15' AS DATE) AS ConvertedDate;

/* 3	47	15:24:25	SELECT CAST('2024-07-15' AS DATE) AS ConvertedDate
 LIMIT 0, 1000	1 row(s) returned	0.015 sec / 0.000 sec */

-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */

-- Output: 
SELECT NOW() AS CurrentTimestamp;
/* 3	48	15:24:44	SELECT NOW() AS CurrentTimestamp
 LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec */

/* b. Extract Year: Get year from order dates */

-- Output: 
SELECT OrderID, OrderDate, YEAR(OrderDate) AS OrderYear FROM Orders;

/* 3	49	15:25:43	SELECT OrderID, OrderDate, YEAR(OrderDate) AS OrderYear FROM Orders
 LIMIT 0, 1000	5 row(s) returned	0.016 sec / 0.000 sec */

/* c. Add Months: Add 3 months to order dates */

-- Output: 
SELECT OrderID, OrderDate, DATE_ADD(OrderDate, INTERVAL 3 MONTH) AS DatePlus3Months FROM Orders;
/* 3	50	15:26:02	SELECT OrderID, OrderDate, DATE_ADD(OrderDate, INTERVAL 3 MONTH) AS DatePlus3Months FROM Orders
 LIMIT 0, 1000	5 row(s) returned	0.015 sec / 0.000 sec */

/* d. Days Since Order: Calculate days between order date and now */
-- Output: 
SELECT OrderID, OrderDate, DATEDIFF(CURDATE(), OrderDate) AS DaysSinceOrder FROM Orders;

/* 3	51	15:26:25	SELECT OrderID, OrderDate, DATEDIFF(CURDATE(), OrderDate) AS DaysSinceOrder FROM Orders
 LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec */
 
-- END of the Task -- 
