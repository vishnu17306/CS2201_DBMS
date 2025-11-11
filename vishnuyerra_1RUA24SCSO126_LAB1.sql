
-- Created by DBMS TEAM
-- Date: [14 August 2024 ]
-- Description: SQL script to create a simple university course management system database, 
--              including the creation, alteration, and deletion of tables.

-- Step 1: Create a new database
CREATE DATABASE db_lab;
# 3	1	14:33:29	CREATE DATABASE db_lab	1 row(s) affected	0.016 sec
    
-- Step 2: Use the newly created database
USE db_lab;
# 3	2	14:34:42	USE db_lab	0 row(s) affected	0.000 sec

-- Step 3: Create the Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,             -- Unique identifier for each student
    FirstName VARCHAR(50),                 -- First name of the student
    LastName VARCHAR(50),                  -- Last name of the student
    Email VARCHAR(100) UNIQUE,             -- Email of the student, must be unique
    DateOfBirth DATE                       -- Date of birth of the student
);

/* 3	3	14:35:29	CREATE TABLE Students (
     StudentID INT PRIMARY KEY,             -- Unique identifier for each student
     FirstName VARCHAR(50),                 -- First name of the student
     LastName VARCHAR(50),                  -- Last name of the student
     Email VARCHAR(100) UNIQUE,             -- Email of the student, must be unique
     DateOfBirth DATE                       -- Date of birth of the student
 )	0 row(s) affected	0.079 sec */


-- Step 4: Create the Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,              -- Unique identifier for each course
    CourseName VARCHAR(100),               -- Name of the course
    Credits INT                            -- Number of credits for the course
);

/* 3	4	14:37:43	CREATE TABLE Courses (
     CourseID INT PRIMARY KEY,              -- Unique identifier for each course
     CourseName VARCHAR(100),               -- Name of the course
     Credits INT                            -- Number of credits for the course
 )	0 row(s) affected	0.047 sec*/
 
 
-- Step 5: Create the Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,          -- Unique identifier for each enrollment
    StudentID INT,                         -- Foreign key referencing Students(StudentID)
    CourseID INT,                          -- Foreign key referencing Courses(CourseID)
    EnrollmentDate DATE,                   -- Date when the student enrolled in the course
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

/*3	5	14:38:35	CREATE TABLE Enrollments (
     EnrollmentID INT PRIMARY KEY,          -- Unique identifier for each enrollment
     StudentID INT,                         -- Foreign key referencing Students(StudentID)
     CourseID INT,                          -- Foreign key referencing Courses(CourseID)
     EnrollmentDate DATE,                   -- Date when the student enrolled in the course
     FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
     FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
 )	0 row(s) affected	0.063 sec*/
 
-- Step 6: Select all records from the Enrollments table
SELECT * FROM Enrollments;
# 3	6	14:39:08	SELECT * FROM Enrollments LIMIT 0, 1000	0 row(s) returned	0.000 sec / 0.000 sec

-- Step 7: Select all records from the Students table
SELECT * FROM Students;
# 3	7	14:40:09	SELECT * FROM Students LIMIT 0, 1000	0 row(s) returned	0.000 sec / 0.000 sec

-- Step 8: Select all records from the Courses table
SELECT * FROM Courses;
# 3	8	14:41:27	SELECT * FROM Courses LIMIT 0, 1000	0 row(s) returned	0.000 sec / 0.000 sec

-- Step 9: Alter the Students table to add a PhoneNumber column
ALTER TABLE Students
ADD PhoneNumber VARCHAR(15);               -- Add a new column for storing phone numbers

/* 3	9	14:43:47	ALTER TABLE Students
 ADD PhoneNumber VARCHAR(15)	0 row(s) affected
 Records: 0  Duplicates: 0  Warnings: 0	0.094 sec */

-- Step 10: Alter the Courses table to modify the Credits column
ALTER TABLE Courses
MODIFY Credits DECIMAL(3, 1);              -- Modify the Credits column to allow decimal values

/* 3	10	14:45:40	ALTER TABLE Courses
 MODIFY Credits DECIMAL(3, 1)	0 row(s) affected
 Records: 0  Duplicates: 0  Warnings: 0	0.078 sec */

-- Step 11: Alter the Enrollments table to add a unique constraint
ALTER TABLE Enrollments
ADD CONSTRAINT UC_StudentCourse UNIQUE (StudentID, CourseID);  -- Ensure unique student-course combinations

/* 3	11	14:46:19	ALTER TABLE Enrollments
 ADD CONSTRAINT UC_StudentCourse UNIQUE (StudentID, CourseID)	0 row(s) affected
 Records: 0  Duplicates: 0  Warnings: 0	0.047 sec */
 
-- Step 12: Drop the Enrollments table
DROP TABLE Enrollments;                    -- Delete the Enrollments table

# 3	12	14:46:52	DROP TABLE Enrollments	0 row(s) affected	0.031 sec 

-- Step 13: Drop the Courses table
DROP TABLE Courses;                        -- Delete the Courses table
DESCRIBE Students;
/* 3	13	14:47:18	DROP TABLE Courses	0 row(s) affected	0.032 sec
3	14	14:47:18	DESCRIBE Students	6 row(s) returned	0.000 sec / 0.000 sec */ 