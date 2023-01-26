/*
Keith Stateson
SQL Exercise 4: order_by_exercises
Codeup
Note, the Answer is simply the command below the Question
*/

-- SELECT employees DB
USE employees;

-- Verify what db you are using
SELECT DATABASE();

-- Explore the db: 6 columns: emp_no, first_name, last_name, gender, birth_date, hire_date
DESCRIBE employees;

-- View all entries. Shows 300024 employees
SELECT * FROM employees;
SELECT COUNT(*) FROM employees;

-- Q2: Find all employees with first names 'Irena', 'Vidya', or 'Maya' using IN and order by first name.
-- What was the first and last name in the first row of the results? 
-- first name in table is Irena Reutenauer, last name is Vidya Simmen
SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name
LIMIT 1;

-- Q3: Find all employees with first names 'Irena', 'Vidya', or 'Maya' using OR,
-- and order your results returned by first name and then last name
-- What was the first and last name in the first row of the results?
-- What was the first and last name of the last person in the table?
-- first name in table is Irena Acton, last name is Vidya Zweizig
SELECT first_name, last_name FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya'
-- or: WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;
-- LIMIT 1;

-- Q4: Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male.
-- And order your results returned by last name and then first name
-- What was the first and last name in the first row of the results?
-- What was the first and last name of the last person in the table?
-- first name in table is Irena Acton, last name is Maya Zyda
SELECT * FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M'
ORDER BY last_name, first_name;

-- Q5: Find all employees whose last name starts and ends with 'E'
-- Sort the results by their employee number.
-- What is the number of employees returned, the first employee number and their first and last name,
-- and the last employee number with their first and last name.
-- 899 employee records. First employee/id in table is 10021 Ramzi Erde, the last is 499648 Tadahiro Erde
SELECT * FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no;

SELECT first_name, last_name FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no
LIMIT 1;

SELECT first_name, last_name FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no DESC
LIMIT 1;

-- Q6: Find all employees whose last name starts and ends with 'E'
-- Sort the results by their hire date, so that the newest employees are listed first.
-- What is the number of employees returned, the name of the newest employee, and the name of the oldest employee.
-- 899 records. Newest employee is Teiji Eldridge, and the oldest employee is Sergi Erde
SELECT first_name, last_name, hire_date FROM employees
WHERE last_name LIKE 'E%e'
ORDER BY hire_date DESC, birth_date;

-- Q7: Find all employees hired in the 90s and born on Christmas.
-- Sort the results so that the oldest employee who was hired last is the first result.
-- 362 records. Oldest employee who was hired last is Tremaine Eugenio, and the youngest employee who was hired last is Gudjon Vakili
SELECT first_name, last_name, birth_date, hire_date FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%-12-25'
ORDER BY birth_date ASC, hire_date DESC;
