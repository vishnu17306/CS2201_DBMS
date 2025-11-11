
-- ======================================================================
-- Lab Experiment – Implementation of Procedures in SQL
-- ======================================================================

-- Objective:
-- 1. To understand and create stored procedures in MySQL.
-- 2. To implement procedures for performing INSERT, UPDATE, and DELETE operations.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS CompanyDB;
CREATE DATABASE CompanyDB;
-- OUTPUT
/* 3	2	22:34:28	CREATE DATABASE CompanyDB	1 row(s) affected	0.047 sec */
USE CompanyDB;
-- OUTPUT
/* 3	3	22:34:43	USE CompanyDB	0 row(s) affected	0.000 sec */

-- ======================================================================
-- Step 2: Create Table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- OUTPUT:
/*
3	4	22:35:02	CREATE TABLE Employees (
     EmpID INT PRIMARY KEY AUTO_INCREMENT,
     EmpName VARCHAR(50),
     Department VARCHAR(50),
     Salary DECIMAL(10,2)
 )	0 row(s) affected	0.062 sec
 */


-- ======================================================================
-- Step 3: Insert Sample Data
INSERT INTO Employees (EmpName, Department, Salary) VALUES
('John', 'IT', 55000),
('Alice', 'HR', 48000),
('Bob', 'Finance', 60000);

-- OUTPUT:
/*
3	5	22:35:21	INSERT INTO Employees (EmpName, Department, Salary) VALUES
 ('John', 'IT', 55000),
 ('Alice', 'HR', 48000),
 ('Bob', 'Finance', 60000)	3 row(s) affected
 Records: 3  Duplicates: 0  Warnings: 0	0.062 sec
*/


-- ======================================================================
-- Task 1: Create a Basic Procedure
-- Create a procedure named `DisplayEmployees` that retrieves all records from the Employees table.
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW
DELIMITER //

CREATE PROCEDURE DisplayEmployees()
BEGIN
    SELECT * FROM Employees;
END //
DELIMITER ;
-- OUTPUT
/*
3	6	22:35:58	CREATE PROCEDURE DisplayEmployees()
 BEGIN
     SELECT * FROM Employees;
 END	0 row(s) affected	0.047 sec
 */

CALL DisplayEmployees();
-- OUPUT
/*
EmpID, EmpName, Department, Salary
1	John	IT	55000.00
2	Alice	HR	48000.00
3	Bob	Finance	60000.00
*/


-- ======================================================================
-- Task 2: Procedure for INSERT Operation
-- Create a procedure named `AddEmployee` that inserts a new employee record.
-- Parameters: (p_name VARCHAR(50), p_dept VARCHAR(50), p_salary DECIMAL(10,2))
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW
DELIMITER //

CREATE PROCEDURE AddEmployee(IN p_name VARCHAR(50), IN p_dept VARCHAR(50), IN p_salary DECIMAL(10,2))
BEGIN
    INSERT INTO Employees (EmpName, Department, Salary)
    VALUES (p_name, p_dept, p_salary);
END //
DELIMITER ;
-- OUTPUT
/*
3	8	22:36:46	CREATE PROCEDURE AddEmployee(IN p_name VARCHAR(50), IN p_dept VARCHAR(50), IN p_salary DECIMAL(10,2))
 BEGIN
     INSERT INTO Employees (EmpName, Department, Salary)
     VALUES (p_name, p_dept, p_salary);
 END	0 row(s) affected	0.047 sec
 */

CALL AddEmployee('David', 'Marketing', 52000);
-- OUTPUT:
/* EmpID, EmpName, Department, Salary
1	John	IT	55000.00
2	Alice	HR	48000.00
3	Bob	Finance	60000.00
4	David	Marketing	52000.00
*/

SELECT * FROM Employees;
-- OUTPUT
/*
EmpID, EmpName, Department, Salary
1	John	IT	55000.00
2	Alice	HR	50000.00
3	Bob	Finance	60000.00
4	David	Marketing	52000.00
*/

-- ======================================================================
-- Task 3: Procedure for UPDATE Operation
-- Create a procedure named `UpdateSalary` to update an employee’s salary based on EmpID.
-- Parameters: (p_empid INT, p_salary DECIMAL(10,2))
DELIMITER //

CREATE PROCEDURE UpdateSalary(
    IN p_empid INT,
    IN p_salary DECIMAL(10,2)
)
BEGIN
    UPDATE Employees
    SET Salary = p_salary
    WHERE EmpID = p_empid;
END //

DELIMITER ;
-- OUTPUT
/*
3	12	22:39:13	CREATE PROCEDURE UpdateSalary(
     IN p_empid INT,
     IN p_salary DECIMAL(10,2)
 )
 BEGIN
     UPDATE Employees
     SET Salary = p_salary
     WHERE EmpID = p_empid;
 END	0 row(s) affected	0.000 sec
 */

CALL UpdateSalary(2, 50000);
-- OUTPUT:
/* 3	13	22:39:32	CALL UpdateSalary(2, 50000)	1 row(s) affected	0.015 sec */

SELECT * FROM Employees;

-- OUTPUT
/*
EmpID, EmpName, Department, Salary
1	John	IT	55000.00
2	Alice	HR	50000.00
3	Bob	Finance	60000.00
4	David	Marketing	52000.00
*/

-- ======================================================================
-- Task 4: Procedure for DELETE Operation
-- Create a procedure named `RemoveEmployee` to delete an employee record based on EmpID.
-- Parameters: (p_empid INT)
DELIMITER //

CREATE PROCEDURE RemoveEmployee(
    IN p_empid INT
)
BEGIN
    DELETE FROM Employees
    WHERE EmpID = p_empid;
END //

DELIMITER ;
-- OUTPUT
/*
3	15	22:40:32	CREATE PROCEDURE RemoveEmployee(
     IN p_empid INT
 )
 BEGIN
     DELETE FROM Employees
     WHERE EmpID = p_empid;
 END	0 row(s) affected	0.000 sec */

CALL RemoveEmployee(3);
-- OUTPUT
/* 3	16	22:40:48	CALL RemoveEmployee(3)	1 row(s) affected	0.047 sec */

SELECT * FROM Employees;
-- OUTPUT
/*
EmpID, EmpName, Department, Salary
1	John	IT	55000.00
2	Alice	HR	50000.00
4	David	Marketing	52000.00
*/


-- ======================================================================
-- END OF EXPERIMENT – Implementation of Procedures
-- ======================================================================
