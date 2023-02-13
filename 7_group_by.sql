/*
Keith Stateson
SQL Exercise 7: group_by_exercises
*/

SHOW DATABASES;
SHOW CREATE DATABASE employees;
SHOW TABLES;
USE employees;
SELECT * FROM employees LIMIT 10; -- get overview of table and pin it

-- Q2: In your script, use DISTINCT to find the unique titles in the titles table.
-- How many unique titles have there ever been? 7
DESCRIBE titles; -- columns include emp_no, title, from_date, to_date
SELECT COUNT(DISTINCT title) FROM titles;

-- Q3: Find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT last_name FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;

-- Q4: Find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT first_name, last_name FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY first_name, last_name;

-- Q5: Find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
-- two methods that achieve the same result: Chleq, Lindqvist, Qiwen
SELECT last_name FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

-- Q6: Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
SELECT last_name, count(last_name) FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- Q7: Find all employees with first names 'Irena', 'Vidya', or 'Maya'.
-- Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT gender, first_name, count(first_name) FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender
ORDER BY first_name;

-- Q8: Using your query that generates a username for all of the employees,
-- generate a count employees for each unique username. 300024
SELECT
	LOWER(CONCAT(
		SUBSTR(first_name, 1, 1),
		SUBSTR(last_name, 1, 4),
		'_',
		LPAD(month(birth_date), 2, 0),
		SUBSTR(birth_date, 3, 2)
		)) AS user_name,
    COUNT(*)
FROM employees
GROUP BY user_name;

-- Q9: From your previous query, are there any duplicate usernames? Yes
-- What is the higest number of times a username shows up? 6
-- Bonus: How many duplicate usernames are there from your previous query? 13,251
-- NOTE: remove query limit, if applicable
SELECT
	LOWER(CONCAT(
		SUBSTR(first_name, 1, 1),
		SUBSTR(last_name, 1, 4),
		'_',
		LPAD(month(birth_date), 2, 0),
		SUBSTR(birth_date, 3, 2)
		)) AS user_name,    
    COUNT(*)
FROM employees
GROUP BY user_name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

/*
Bonus: More practice with aggregate functions
*/

-- Bonus Q1: Determine the historic average salary for each employee. 63054.4341
-- When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.
SELECT * FROM salaries LIMIT 10;

SELECT * FROM salaries;
SELECT max(to_date) from salaries; -- find keyterm to denote current employees

SELECT emp_no, AVG(salary) FROM salaries
WHERE to_date NOT LIKE '9999%'
GROUP BY emp_no;

-- Bonus Q2: Using the dept_emp table, count how many current employees work in each department.
-- The query result should show 9 rows, one for each department and the employee count.
SHOW TABLES;
USE dept_emp; -- emp_no, dept_no, from_date, to_date
SELECT * FROM dept_emp LIMIT 10;

SELECT dept_no, COUNT(emp_no) FROM dept_emp
WHERE to_date NOT LIKE '9999%'
GROUP BY dept_no;

-- Bonus Q3: Determine how many different salaries each employee has had. This includes both historic and current.
SELECT emp_no, COUNT(salary) FROM salaries
GROUP BY emp_no;

-- Bonus Q4: Find the maximum salary for each employee.
SELECT emp_no, MAX(salary) FROM salaries
GROUP BY emp_no;

-- Bonus Q5: Find the minimum salary for each employee.
SELECT emp_no, MIN(salary) FROM salaries
GROUP BY emp_no;

-- Bonus Q6: Find the standard deviation of salaries for each employee.
SELECT stddev(salary) FROM salaries
GROUP BY emp_no;

-- Bonus Q7: Now find the max salary for each employee where that max salary is greater than $150,000.
SELECT emp_no, max(salary) AS max_sal FROM salaries
GROUP BY emp_no
HAVING max_sal > 150000;

-- Bonus Q8: Find the average salary for each employee where that average salary is between $80k and $90k.
SELECT emp_no, AVG(salary) AS avg_sal FROM salaries
GROUP BY emp_no
HAVING avg_sal > 80000 AND avg_sal < 90000;
