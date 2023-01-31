/*
Keith Stateson
SQL Exercise 1: tables_exercises
Codeup
*/

SHOW DATABASES; -- list all the databases
SELECT DATABASE(); -- verify what database you are using

-- Q3: Select employees database.
USE employees;

-- Q4: List all tables in employees database.
SHOW TABLES;

-- Q5: What different data types are present on this table? int, date, and string (varchar and enum)
DESCRIBE employees;
EXPLAIN employees;

-- Q6: Which table(s) do you think contain a numeric type column? emp_no

-- Q7: Which table(s) do you think contain a string type column? first_name and last_name

-- Q8: Which table(s) do you think contain a date type column? birth_date and hire_date

-- Q9: What is the relationship between the employees and the departments tables?
DESCRIBE departments;
DESCRIBE dept_manager;
-- dept_no column is found in both departments and dept_manager
-- "employee" can refer to either the employee db or the employee table
-- a common attribute (column) within more than one table means that data from thoese tables can be queried together

-- Q10 : Show the original command used to create the dept_manager table.
SHOW CREATE TABLE dept_manager;