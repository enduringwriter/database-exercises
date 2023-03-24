/*
Keith Stateson
SQL Exercise 3: where_excercises
*/

SHOW DATABASES; -- view all databases
USE employees; -- select database to work with
SELECT DATABASE(); -- view database you are working with
SHOW CREATE DATABASE employees;

SHOW TABLES; -- view all tables in the database
DESCRIBE employees; -- explore the table: emp_no, first_name, last_name, gender, birth_date, hire_date
SELECT * FROM employees LIMIT 10; -- get overview/snapshot of the table 

-- Q2: Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN: 709 records
SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
SELECT COUNT(*) FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');

-- Q3: Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using OR.
-- Does the output match the output in the previous question? 709 records, yes, the output is the same with "IN" and "OR"
SELECT * FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

-- Q4: Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. 441 records
SELECT * FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M';
SELECT COUNT(*) FROM employees WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M';

-- Q5: Find all current or previous employees whose last name starts with 'E'. 7330 records
SELECT * FROM employees
WHERE last_name LIKE 'E%';
SELECT COUNT(*) FROM employees WHERE last_name LIKE 'E%';

-- Q6a: Find all current or previous employees whose last name starts or ends with 'E'. 30723 records
SELECT * FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%E';
SELECT COUNT(*) FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

-- Q6b: Find all current or previous employees whose last name ends with 'E', but does not start with 'E'?. 23393 records
SELECT * FROM employees
WHERE last_name LIKE '%E' AND last_name NOT LIKE 'E%';
SELECT COUNT(*) FROM employees WHERE last_name LIKE '%E' AND last_name NOT LIKE 'E%';

-- Q7a: Find all current or previous employees employees whose last name starts and ends with 'E'. 899 records
SELECT * FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';
SELECT COUNT(*) FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E';

Select * FROM employees
WHERE last_name LIKE 'E%e';

-- Q7a: How many employees' last names end with E, regardless of whether they start with E?. 24292 records
SELECT * FROM employees
WHERE last_name LIKE '%E';
SELECT COUNT(*) FROM employees WHERE last_name LIKE '%E';

-- Q8: Find all current or previous employees hired in the 90s. 135214 records
-- two methods to achieve the same result
SELECT * FROM employees
WHERE hire_date >= '1990-01-01' AND hire_date <= '1999-12-31';

SELECT * FROM employees
WHERE hire_date LIKE '199%';

-- Q9: Find all current or previous employees born on Christmas. 842 records
SELECT * FROM employees
WHERE birth_date LIKE '%%%%-12-25';

-- Q10: Find all current or previous employees hired in the 90s and born on Christmas. 362 records
SELECT * FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%%%%-12-25';

-- Q11: Find all current or previous employees with a 'q' in their last name. 1873 records
SELECT first_name, last_name FROM employees
WHERE last_name LIKE '%q%';

-- Q12: Find all current or previous employees with a 'q' in their last name but not 'qu'. 547 records
SELECT * FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
SELECT COUNT(*) FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
