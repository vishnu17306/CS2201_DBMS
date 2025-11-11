
-- ======================================================================
-- Lab Experiment 02 – Implementation of DML Commands in SQL
-- ======================================================================

-- Objective:
-- To implement DML (Data Manipulation Language) commands such as 
-- INSERT, UPDATE, and DELETE using suitable examples.

-- Scenario:
-- You are managing a database for a library with two tables: Books and Members.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS LibraryDB;
CREATE DATABASE LibraryDB;
USE LibraryDB;

/* 	#	Time	Action	Message	Duration / Fetch
1	1	14:59:12	DROP DATABASE IF EXISTS LibraryDB	0 row(s) affected, 1 warning(s):
 1008 Can't drop database 'librarydb'; database doesn't exist	0.000 sec
3	2	14:59:12	CREATE DATABASE LibraryDB	1 row(s) affected	0.031 sec
3	3	14:59:12	USE LibraryDB	0 row(s) affected	0.000 sec */

-- ======================================================================
-- Task 01: Create Tables
-- Create Books and Members tables as per given structure.

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author VARCHAR(50),
    published_year YEAR,
    available_copies INT,
    total_copies INT,
    genre VARCHAR(50),
    ISBN VARCHAR(20)
);

/* 3	4	14:59:50	CREATE TABLE Books (
     book_id INT PRIMARY KEY AUTO_INCREMENT,
     title VARCHAR(100),
     author VARCHAR(50),
     published_year YEAR,
     available_copies INT,
     total_copies INT,
     genre VARCHAR(50),
     ISBN VARCHAR(20)
 )	0 row(s) affected	0.047 sec */


CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    membership_date DATE,
    membership_type VARCHAR(20),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(100)
);

/* 3	5	15:00:26	CREATE TABLE Members (
     member_id INT PRIMARY KEY AUTO_INCREMENT,
     first_name VARCHAR(50),
     last_name VARCHAR(50),
     membership_date DATE,
     membership_type VARCHAR(20),
     email VARCHAR(100),
     phone_number VARCHAR(20),
     address VARCHAR(100)
 )	0 row(s) affected	0.062 sec */

-- write the query here to verify the creation
SHOW TABLES;
DESCRIBE Books;
DESCRIBE Members;


-- WRITE YOUR OUTPUT BELOW
/* 3	6	15:00:50	SHOW TABLES	2 row(s) returned	0.016 sec / 0.000 sec
3	7	15:00:50	DESCRIBE Books	8 row(s) returned	0.000 sec / 0.000 sec
3	8	15:00:50	DESCRIBE Members	8 row(s) returned	0.016 sec / 0.000 sec */


-- ======================================================================
-- Task 02: Integrity Constraints
-- Ensure that available_copies is always less than or equal to total_copies.


-- WRITE YOUR QUERY BELOW
ALTER TABLE Books
ADD CONSTRAINT chk_copies CHECK (available_copies <= total_copies);

/* 3	9	15:01:59	ALTER TABLE Books
 ADD CONSTRAINT chk_copies CHECK (available_copies <= total_copies)	0 row(s) affected
 Records: 0  Duplicates: 0  Warnings: 0	0.063 sec */
 
-- OUTPUT:
-- (Display confirmation message or describe constraint added.)
-- WRITE YOUR OUTPUT BELOW
SHOW CREATE TABLE Books;
 # 3	11	15:02:29	SHOW CREATE TABLE Books	1 row(s) returned	0.000 sec / 0.000 sec



-- ======================================================================
-- Task 03: Insert a New Book
-- Scenario: Insert a record for the new book titled 
-- '1984_The Black Swan' by George Orwell (published in 1949, 4 copies available).
-- WRITE YOUR QUERY BELOW
INSERT INTO Books (title, author, published_year, available_copies, total_copies, genre, ISBN)
VALUES ('1984_The Black Swan', 'George Orwell', 1949, 4, 4, 'Dystopian Fiction', 'ISBN1234567890');

/* 3	12	15:03:24	INSERT INTO Books (title, author, published_year, available_copies, total_copies, genre, ISBN)
 VALUES ('1984_The Black Swan', 'George Orwell', 1949, 4, 4, 'Dystopian Fiction', 'ISBN1234567890')	1 row(s) affected	0.031 sec */


-- OUTPUT:
-- (Run SELECT * FROM Books; to verify insertion)
-- WRITE YOUR OUTPUT BELOW
SELECT * FROM Books;
/* 3	13	15:03:43	SELECT * FROM Books
 LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec */


-- ======================================================================
-- Task 04: Add New Members
-- Scenario:
-- Member 1: David Lee, Membership Date – 2024-04-15, Membership Type – Platinum
-- Member 2: Emma Wilson, Membership Date – 2024-05-22, Membership Type – Silver
-- WRITE YOUR QUERIES BELOW
INSERT INTO Members (first_name, last_name, membership_date, membership_type, email, phone_number, address)
VALUES 
('David', 'Lee', '2024-04-15', 'Platinum', 'david.lee@gmail.com', '9991112223', 'New York'),
('Emma', 'Wilson', '2024-05-22', 'Silver', 'emma.wilson@gmail.com', '8882223334', 'California');

/* 3	14	15:04:03	INSERT INTO Members (first_name, last_name, membership_date, membership_type, email, phone_number, address)
 VALUES 
 ('David', 'Lee', '2024-04-15', 'Platinum', 'david.lee@gmail.com', '9991112223', 'New York'),
 ('Emma', 'Wilson', '2024-05-22', 'Silver', 'emma.wilson@gmail.com', '8882223334', 'California')	2 row(s) affected
 Records: 2  Duplicates: 0  Warnings: 0	0.031 sec */

-- OUTPUT:
-- (Run SELECT * FROM Members; to verify insertion)
-- WRITE YOUR OUTPUT BELOW
SELECT * FROM Members;
/* 3	15	15:04:24	SELECT * FROM Members
 LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec */



-- ======================================================================
-- Task 05: Update Book Details
-- Scenario: The library has acquired 2 additional copies of the book '1984'.
-- Update the record accordingly.
-- WRITE YOUR QUERY BELOW
SET SQL_SAFE_UPDATES = 0;
UPDATE Books
SET available_copies = available_copies + 2,
    total_copies = total_copies + 2
WHERE title = '1984_The Black Swan';

/* 3	16	15:04:59	SET SQL_SAFE_UPDATES = 0	0 row(s) affected	0.000 sec
3	17	15:04:59	UPDATE Books
 SET available_copies = available_copies + 2,
     total_copies = total_copies + 2
 WHERE title = '1984_The Black Swan'	1 row(s) affected
 Rows matched: 1  Changed: 1  Warnings: 0	0.031 sec */

-- OUTPUT:
-- (Run SELECT * FROM Books; to check updated copies)
-- WRITE YOUR OUTPUT BELOW
SELECT book_id, title, available_copies, total_copies FROM Books;
/* 3	18	15:05:45	SELECT book_id, title, available_copies, total_copies FROM Books
 LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec */



-- ======================================================================
-- Task 06: Modify a Member's Information
-- Scenario: Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- WRITE YOUR QUERY BELOW
UPDATE Members
SET membership_type = 'Gold'
WHERE first_name = 'Emma' AND last_name = 'Wilson';
SET SQL_SAFE_UPDATES = 1;

/* 3	19	15:06:15	UPDATE Members
 SET membership_type = 'Gold'
 WHERE first_name = 'Emma' AND last_name = 'Wilson'	1 row(s) affected
 Rows matched: 1  Changed: 1  Warnings: 0	0.016 sec
3	20	15:06:15	SET SQL_SAFE_UPDATES = 1	0 row(s) affected	0.000 sec */

-- OUTPUT:
-- (Run SELECT * FROM Members; to check updated membership)
-- WRITE YOUR OUTPUT BELOW
SELECT member_id, first_name, last_name, membership_type FROM Members;
/* 3	21	15:06:39	SELECT member_id, first_name, last_name, membership_type FROM Members
 LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec */


-- ======================================================================
-- Task 07: Delete a Book Record
-- Scenario: The book '1984_The Black Swan' is no longer available in the library.
-- Remove it from the database.
-- WRITE YOUR QUERY BELOW
DELETE FROM Books
WHERE title = '1984_The Black Swan';


-- OUTPUT:
-- (Run SELECT * FROM Books; to verify deletion)
-- WRITE YOUR OUTPUT BELOW
SELECT * FROM Books;




-- ======================================================================
-- Task 08: Remove a Member
-- Scenario: David Lee has canceled his membership. Remove his record.
-- WRITE YOUR QUERY BELOW
SET SQL_SAFE_UPDATES = 0;

DELETE FROM Members
WHERE first_name = 'David' AND last_name = 'Lee';

/* 3	24	15:09:52	DELETE FROM Members
 WHERE first_name = 'David' AND last_name = 'Lee'	1 row(s) affected	0.015 sec */ 


-- OUTPUT:
-- (Run SELECT * FROM Members; to verify deletion)
-- WRITE YOUR OUTPUT BELOW
SELECT * FROM Members;
/* 3	25	15:10:38	SELECT * FROM Members
 LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec */



-- ======================================================================
-- Extension (Optional)
-- Task: Create a Borrowing table to track which members have borrowed which books.
-- Include foreign keys referencing Books(book_id) and Members(member_id).
-- WRITE YOUR TABLE CREATION QUERY BELOW
CREATE TABLE Borrowing (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

/* 3	26	15:11:20	CREATE TABLE Borrowing (
     borrow_id INT PRIMARY KEY AUTO_INCREMENT,
     member_id INT,
     book_id INT,
     borrow_date DATE,
     return_date DATE,
     FOREIGN KEY (member_id) REFERENCES Members(member_id),
     FOREIGN KEY (book_id) REFERENCES Books(book_id)
 )	0 row(s) affected	0.063 sec */

-- OUTPUT:
-- (Run DESC Borrowing; to verify structure)
-- WRITE YOUR OUTPUT BELOW
DESC Borrowing;
# 3	27	15:11:46	DESC Borrowing	5 row(s) returned	0.000 sec / 0.000 sec 

-- ======================================================================
-- END OF EXPERIMENT 02
-- ======================================================================
