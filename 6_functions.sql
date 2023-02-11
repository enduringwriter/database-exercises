/*
Keith Stateson
SQL Exercise 6: functions_exercises - uses order_by_exercises #4
Codeup
*/

SHOW DATABASES; -- show databases
USE employees; -- select employees database
SELECT DATABASE(); -- show current database being used
SHOW CREATE DATABASE employees; -- displays the command that created the database

SHOW TABLES; -- show tables within employees database
DESCRIBE employees; -- describe employees table, has 6 columns: emp_no, birth_date, first_name, last_name, hire_date
SELECT * FROM employees LIMIT 1; -- get overview of table and pin it

-- Q2: Write a query to to find all employees whose last name starts and ends with 'E'.
-- Use concat() to combine their first and last name together as a single column named full_name.
SELECT CONCAT(first_name, last_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%E';

-- Q3: Convert the names produced in your last query to all uppercase.
SELECT UPPER(CONCAT(first_name, last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'E%E';

-- Q4: Find all employees hired in the 90s and born on Christmas.
-- Use datediff() function to find how many days they have been working at the company.
-- Hint: You will also need to use NOW() or CURDATE().
SELECT hire_date, CONCAT(FORMAT(DATEDIFF(CURDATE(), hire_date), 'N'), ' days') AS Days_at_Co
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';

-- Q5: Find the smallest and largest current salary from the salaries table.
-- Hint: "current" salary
-- two methods that achieve the same result
SELECT * FROM salaries LIMIT 1;

-- get employees who are currently employed
SELECT * FROM salaries;
SELECT max(to_date) FROM salaries;

-- another way to get employees who are currently employed
SELECT * FROM salaries
WHERE to_date > now();

-- answer to question
SELECT MIN(salary), MAX(salary)
FROM salaries
WHERE to_date = '9999-01-1'; -- min/max salary is $38,623/$158,220

-- the following commands are all employees both formerly and currently employed and therefore not correct commands
-- SELECT CONCAT('$', FORMAT(MAX(salary), 'C')) FROM salaries;
-- SELECT CONCAT('$', FORMAT(MIN(salary), 'C')) FROM salaries; 

-- Q6: Use your knowledge of built in SQL functions to generate a username for all of the employees.
--  A username should be all lowercase, and consist of the first character of the employees first name,
-- the first 4 characters of the employees last name, an underscore, the month the employee was born,
-- and the last two digits of the year that they were born.

SELECT CONCAT(
	SUBSTR(lower(first_name), 1, 1),
    SUBSTR(lower(last_name), 1, 4),
    '_',
    LPAD(MONTH(birth_date), 2, 0), -- 2 characters, 0 padding
    SUBSTR(birth_date, 3, 2)
	)
FROM employees;
