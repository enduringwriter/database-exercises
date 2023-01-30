/*
Keith Stateson
SQL Exercise 6: functions_exercises - uses order_by_exercises #4
Codeup
Note, the Answer is simply the command below the Question
*/

SHOW DATABASES; -- show databases
USE employees; -- select database employees
SELECT DATABASE(); -- every current database being used
DESCRIBE employees; -- describe database shows 6 columns: emp_no, birth_date, first_name, last_name, hire_date
SHOW TABLES; -- show tables within employees database
SELECT * FROM employees LIMIT 1;

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
SELECT CONCAT(FORMAT(DATEDIFF(CURDATE(), hire_date), 'N'), ' days')
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';

-- Q5: Find the smallest and largest current salary from the salaries table.
SELECT CONCAT('$', FORMAT(MAX(salary), 'C')) FROM salaries; -- $158,220
SELECT CONCAT('$', FORMAT(MIN(salary), 'C')) FROM salaries; -- $38,623

-- Q6: Use your knowledge of built in SQL functions to generate a username for all of the employees.
--  A username should be all lowercase, and consist of the first character of the employees first name,
-- the first 4 characters of the employees last name, an underscore, the month the employee was born,
-- and the last two digits of the year that they were born.
-- SELECT birth_date FROM employees;

SELECT CONCAT(
	SUBSTR(lower(first_name), 1, 1),
    SUBSTR(lower(last_name), 1, 4),
    '_',
    SUBSTR(birth_date, 6, 2),
    SUBSTR(year(birth_date), 3, 2)
	)
FROM employees;
