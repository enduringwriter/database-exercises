/*
Keith Stateson
SQL Exercise 9: subqueries
*/

SHOW DATABASES;
USE employees;
SELECT DATABASE();
SHOW TABLES; -- departments, dept_emp, dept_manager, employees, salaries, titles

DESCRIBE departments; -- dept_no, dept_name
DESCRIBE dept_emp; -- emp_no, dept_no, from_date, to_date
DESCRIBE dept_manager; -- emp_no, dept_no, from_date, to_date
DESCRIBE employees; -- emp_no, birth_date, first_name, last_name, gender, hire_date
DESCRIBE salaries; -- emp_no, salary, from_date, to_date
DESCRIBE titles; -- emp_no, title, from_date, to_date

-- get employees who are currently employed using one of the following methods:
SELECT DISTINCT to_date FROM salaries ORDER BY to_date DESC LIMIT 10;
SELECT MAX(to_date) FROM salaries;
SELECT * FROM salaries WHERE to_date > NOW();


-- ==========================================
-- Q1: Find all the current employees with the same hire date as employee 101010 using a subquery.
SELECT first_name, last_name FROM employees
WHERE hire_date = (
	SELECT hire_date FROM employees
    WHERE emp_no = '101010'
);

-- ==========================================
-- Q2: Find all the titles ever held by all current employees with the first name Aamod.
SELECT title, first_name, last_name FROM employees
JOIN titles USING (emp_no)
WHERE first_name IN (
	SELECT first_name FROM employees
    WHERE first_name = 'Aamod'
	)
AND to_date LIKE '9999%';

-- ==========================================
-- Q3: How many people in the employees table are no longer working for the company? 59900
SELECT COUNT(emp_no) FROM employees
WHERE emp_no NOT IN (
	SELECT emp_no FROM dept_emp
    WHERE to_date LIKE '9999%'
	)
;

-- ==========================================
-- Q4: Find all the current department managers that are female: Isamu Legleitner, Karsten Sigstam, Leon DasSarma, Hilary Kambil
SELECT first_name, last_name, gender FROM employees
WHERE emp_no IN (
	SELECT emp_no FROM dept_manager
    WHERE to_date LIKE '9999%'
    )
AND gender = 'F'
;

-- ==========================================
-- Q5: Find all the employees who currently have a higher salary than the companies overall, historical average salary.

-- ansewr to Q5 doesn't seem right compared to the question being asked....

SELECT AVG(salary) FROM salaries
WHERE to_date NOT LIKE '9999%'; -- 63054.4341

SELECT first_name, last_name, salary, to_date FROM employees
JOIN salaries USING (emp_no)
WHERE salary > (
	SELECT AVG(salary) FROM salaries
    WHERE to_date NOT LIKE '9999%'
    )
AND to_date LIKE '9999%'
;

-- ==========================================
-- Q6a: How many current salaries are within 1 standard deviation of the current highest salary: 83
-- Hint there is std deviation of income above the max salary b/c its the max salary.
-- Hint: you can use a built in function to calculate the standard deviation.
-- Q6b: What percentage of all salaries is this: 0.0346 %
-- Hint: You will likely use multiple subqueries in a variety of ways
-- Hint: It's good practice to write out all of the small queries that you can.
-- Add a comment above the query showing the number of rows returned.
-- You will use this number (or the query that produced it) in other, larger queries.

SELECT STDDEV(salary) FROM salaries WHERE to_date LIKE '9999%';  -- 17309.95933634675
SELECT MAX(salary) FROM salaries WHERE to_date LIKE '9999%';  -- 158220

SELECT COUNT(*) FROM salaries
WHERE to_date LIKE '9999%' AND salary >
	(
    (SELECT MAX(salary) FROM salaries WHERE to_date LIKE '9999%') -
    (SELECT STDDEV(salary) FROM salaries WHERE to_date LIKE '9999%')
    )
;

SELECT COUNT(salary) FROM salaries WHERE to_date LIKE '9999%'; -- 240124 total salaries

SELECT
	(
	SELECT COUNT(*) FROM salaries
	WHERE to_date LIKE '9999%' AND salary >
		(
		(SELECT MAX(salary) FROM salaries WHERE to_date LIKE '9999%') -
		(SELECT STDDEV(salary) FROM salaries WHERE to_date LIKE '9999%')
		)
	)
	/
    (SELECT COUNT(salary) FROM salaries WHERE to_date LIKE '9999%')
	* 100
;
