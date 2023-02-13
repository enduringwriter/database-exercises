/*
Keith Stateson
SQL Exercise 4: order_by_exercises - uses where_exercises #3
*/

SHOW DATABASES;
USE employees; -- get employees table
SELECT DATABASE(); -- verify what db you are using
SHOW CREATE DATABASE employees;

SHOW TABLES; -- show tables in db
DESCRIBE employees; -- explore employee db, has 6 columns: emp_no, first_name, last_name, gender, birth_date, hire_date
SELECT * FROM employees; -- view all entries in the table
SELECT COUNT(*) FROM employees; -- count all entries in the table

-- Q2: Find all employees with first names 'Irena', 'Vidya', or 'Maya' using IN and order by first name.
-- What was the first and last name in the first row of the results? first name in table is Irena Reutenauer, last name is Vidya Simmen
SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name
LIMIT 1;

-- Q3: Find all employees with first names 'Irena', 'Vidya', or 'Maya' using OR,
-- and order your results returned by first name and then last name.
-- What was the first and last name in the first row of the results? Irena Acton
-- What was the first and last name of the last person in the table? Vidya Zweizig
SELECT first_name, last_name FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya'
-- WHERE first_name IN ('Irena', 'Vidya', 'Maya') -- alternate option instead of using "OR"
ORDER BY first_name, last_name;
-- LIMIT 1; -- optional, and add ASC or DESC to get the first and last entry

-- Q4: Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male.
-- And order your results returned by last name and then first name
-- What was the first and last name in the first row of the results? Irena Acton
-- What was the first and last name of the last person in the table? Maya Zyda
SELECT * FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M'
ORDER BY last_name, first_name;

-- Q5: Find all employees whose last name starts and ends with 'E'. Sort the results by their employee number.
-- What is the number of employees returned, the first employee number and their first and last name,
-- and the last employee number with their first and last name. 899 employee records, 10021 Ramzi Erde, 499648 Tadahiro Erde
SELECT first_name, last_name FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no
LIMIT 1;

SELECT first_name, last_name FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no DESC
LIMIT 1;

-- Q6: Find all employees whose last name starts and ends with 'E'. Sort the results by their hire date,
-- so that the newest employees are listed first. What is the number of employees returned, the name of the newest employee,
-- and the name of the oldest employee. 899 records, Teiji Eldridge, Sergi Erde
SELECT first_name, last_name, hire_date FROM employees
WHERE last_name LIKE 'E%e'
ORDER BY hire_date DESC, birth_date;

-- Q7: Find all employees hired in the 90s and born on Christmas.
-- Sort the results so that the oldest employee who was hired last is the first result. 362 records, Tremaine Eugenio, Gudjon Vakili
SELECT first_name, last_name, birth_date, hire_date FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%-12-25'
ORDER BY birth_date ASC, hire_date DESC;
