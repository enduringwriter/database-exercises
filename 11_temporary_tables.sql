/*
Keith Stateson
SQL Exercise 11: temporary tables
*/

SHOW DATABASES;
USE employees;
SELECT DATABASE();
SHOW TABLES;

DESCRIBE departments; -- dept_no, dept_name
DESCRIBE dept_emp; -- emp_no, dept_no, from_date, to_date
DESCRIBE dept_manager; -- emp_no, dept_no, from_date, to_date
DESCRIBE employees; -- emp_no, birth_date, first_name, last_name, gender, hire_date
DESCRIBE salaries; -- emp_no, salary, from_date, to_date
DESCRIBE titles; -- emp_no, title, from_date, to_date

-- ==========================================
-- Q1: Using the example from the lesson, create a temporary table called employees_with_departments that 
-- contains first_name, last_name, and dept_name for employees currently with that department. 
-- Be absolutely sure to create this table on your own database.
-- If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.

SHOW GRANTS;

CREATE TEMPORARY TABLE keith.employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees
JOIN dept_emp USING (emp_no)
JOIN departments USING (dept_no)
WHERE dept_emp.to_date LIKE '9999%'
LIMIT 10;

-- ==========================================
-- Q1a: 




-- ==========================================
-- Q1b: 




-- ==========================================
-- Q1c: 




-- ==========================================
-- Q1b: 




-- ==========================================
-- Q2: 




-- ==========================================
-- Q3: 



-- ==========================================
-- Q4: 


