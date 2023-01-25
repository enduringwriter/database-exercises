-- List all the databases
SHOW DATABASES;
-- Select employees database
USE employees;
-- Show tables in employees database
SHOW TABLES;
-- Code that created the employees table
SHOW CREATE TABLE employees;
-- Explore the employees table. Use DESCRIBE or EXPLAIN
DESCRIBE employees;
EXPLAIN employees;
-- data types include: int, date, and string (varchar and enum)
-- Q6 Which table(s) do you think contain a numeric type column?
-- A6 emp_no (which likely stands for employee number)
-- Q7 Which table(s) do you think contain a string type column?
-- A7 first_name and last_name
-- Q8 Which table(s) do you think contain a date type column?
-- Q8 birth_date and hire_date
DESCRIBE departments;
DESCRIBE dept_manager;
-- Q9 What is the relationship between the employees and the departments tables?
/* A9 employees is a db while departments are tables,
employees needs to be specified as it can be the db or the table,
and all tables in departments have a common feature "dept_no" */
SHOW CREATE TABLE dept_manager;