/*
Keith Stateson
SQL Exercise 1
Codeup
Note, the Answer in most cases is simply the command below the Question
*/

-- List all the databases
SHOW DATABASES;

-- Select employees database
USE employees;

-- Show all tables in employees database
SHOW TABLES;

-- Explore the employees table: DESCRIBE or EXPLAIN
DESCRIBE employees;
EXPLAIN employees;
-- Q: What different data types are present on this table?
-- A: int, date, and string (varchar and enum)

-- Q: Which table(s) do you think contain a numeric type column?
-- A: emp_no

-- Q: Which table(s) do you think contain a string type column?
-- A: first_name and last_name

-- Q: Which table(s) do you think contain a date type column?
-- A: birth_date and hire_date

-- Q: What is the relationship between the employees and the departments tables?
DESCRIBE departments;
DESCRIBE dept_manager;
-- A: dept_no column is found in both departments and dept_manager
-- A: "employee" can refer to either the employee db or the employee table, specification is required

-- Q: Show the original command used to create the dept_manager table
SHOW CREATE TABLE dept_manager;