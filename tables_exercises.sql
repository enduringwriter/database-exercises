/*
Keith Stateson
SQL Exercise 1: tables_exercises
Codeup
Note, the Answer in most cases is simply the command below the Question
*/

-- List all the databases
SHOW DATABASES;

-- Q3: Select employees database
USE employees;

-- Q4: List all tables in employees database
SHOW TABLES;

-- Q5: What different data types are present on this table?
DESCRIBE employees;
EXPLAIN employees;
-- int, date, and string (varchar and enum)

-- Q6: Which table(s) do you think contain a numeric type column?
-- emp_no

-- Q7: Which table(s) do you think contain a string type column?
-- first_name and last_name

-- Q8: Which table(s) do you think contain a date type column?
-- birth_date and hire_date

-- Q9: What is the relationship between the employees and the departments tables?
DESCRIBE departments;
DESCRIBE dept_manager;
-- dept_no column is found in both departments and dept_manager
-- "employee" can refer to either the employee db or the employee table, specification is required

-- Q10 : Show the original command used to create the dept_manager table
SHOW CREATE TABLE dept_manager;