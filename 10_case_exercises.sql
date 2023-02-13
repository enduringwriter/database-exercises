/*
Keith Stateson
SQL Exercise 10: CASE statement and IF function
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

-- ==========================================
-- Q1: Write a query that returns all employees, their department number, their start date, their end date, 
-- and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

SELECT first_name, last_name, hire_date, to_date FROM employees
JOIN dept_emp USING (emp_no) LIMIT 10;

SELECT emp_no, dept_no, first_name, last_name, hire_date, to_date,
	IF (to_date LIKE '9999%', TRUE, FALSE) AS is_current_employee
--    to_date LIKE '9999%' AS is_current_employee  -- alternate version of IF statement above. can use: to_date > NOW() AS is_current_employee
FROM employees
JOIN dept_emp USING (emp_no)
ORDER BY emp_no
LIMIT 100;


-- ==========================================
-- Q2: Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 
-- 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT *, left(last_name, 1) AS first_letter_of_last_name,
	CASE
		WHEN left(last_name, 1) IN ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h') THEN 'A-H'
        WHEN left(last_name, 1) <= 'Q' THEN 'I-Q'
        WHEN left(last_name, 1) <= 'Z' THEN 'R-Z'
        ELSE last_name
END AS alpha_group
FROM employees
ORDER BY emp_no
LIMIT 100;


-- ==========================================
-- Q3: How many employees (current or previous) were born in each decade?
SELECT birth_date FROM employees LIMIT 10;

SELECT COUNT(birth_date) FROM employees;  -- 300024

SELECT MIN(birth_date), MAX(birth_date) FROM employees;  -- min = 1952-02-01, max = 1965-02-01

SELECT COUNT(birth_date) FROM employees
WHERE birth_date >= '1950-01-01' AND birth_date < '1960-01-01' LIMIT 100;  -- Birthdays in 1950's decade: 182886

SELECT *,
	CASE
		WHEN birth_date >= '1950-01-01' AND birth_date < '1960-01-01' THEN 'birthday\'s 1950\'s'
        WHEN birth_date >= '1960-01-01' AND birth_date < '1970-01-01' THEN 'birthday\'s 1960\'s'
		ELSE birth_date
END AS Birth_Decade
FROM employees
ORDER BY Birth_Decade
LIMIT 100;


-- ==========================================
-- Q4: What is the current average salary for each of the following department groups: R&D, 
-- Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT AVG(salary),
	CASE
		WHEN dept_name IN ('research', 'development') THEN 'R&D'
        WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
        WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
        WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
        ELSE dept_name
	END AS dept_group
FROM departments
JOIN dept_emp de USING (dept_no)
JOIN salaries AS s USING (emp_no)
WHERE de.to_date LIKE '9999%' AND s.to_date LIKE '9999%'
GROUP BY dept_group
;
