/*
Keith Stateson
SQL Exercise 8: join_exercises
Codeup
*/

SHOW DATABASES;
USE employees;
SElECT DATABASE();
SHOW tables; -- departments, dept_emp, dept_manager, employees, salaries, titles

DESCRIBE departments; -- dept_no, dept_name
DESCRIBE dept_emp; -- emp_no, dept_no, from_date, to_date
DESCRIBE dept_manager; -- emp_no, dept_no, from_date, to_date
DESCRIBE employees; -- emp_no, birth_date, first_name, last_name, gender, hire_date
DESCRIBE salaries; -- emp_no, salary, from_date, to_date
DESCRIBE titles; -- emp_no, title, from_date, to_date

-- Q2: Use Associate Table Joins to write a query that shows each department
-- along with the name of the current manager for that department.
-- HINT: association involves 3 tables

SELECT to_date FROM dept_manager WHERE to_date > now(); -- Find date format of current managers: 9999-01-01
-- SELECT max(to_date) FROM dept_manager; -- alternate method

SELECT departments.dept_name AS 'Department Name', -- select specified columns to be displayed in the table
	CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager'
FROM employees -- choose first table
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no -- choose 2nd table and specify emp_no as the foreign key
JOIN departments ON departments.dept_no = dept_manager.dept_no -- choose the 3rd table and specify dept_no as the foreign key
WHERE dept_manager.to_date LIKE '9999%'
ORDER BY departments.dept_name ASC; -- restrict output to current managers

-- Q3: Find the name of all departments currently managed by women.
SELECT * FROM employees LIMIT 10; -- Find format/nomenclature of gender: F
SELECT * FROM dept_manager LIMIT 10; -- Explore dept_manager table: shows multiple managers for one department b/c some are former managers
SELECT to_date FROM dept_manager WHERE to_date > now(); -- Find date fromat of current employees: 9999-01-01

SELECT departments.dept_name AS 'Department Name',
	CONCAT(employees.first_name, ' ', employees.last_name) AS 'Manager Name'
FROM employees
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE employees.gender = 'F' AND dept_manager.to_date LIKE '9999%'
ORDER BY departments.dept_name ASC;

-- Q4: Find and count the current titles of employees currently working in the Customer Service department.
-- Explore titles table
SELECT * FROM titles WHERE titles.to_date LIKE '9999%' AND title = 'Manager' LIMIT 10 ;
SELECT * FROM departments GROUP BY dept_name; -- find format for customer service
-- SELECT DISTINCT dept_name FROM departments; -- alternate method

SELECT titles.title AS 'Title',
	COUNT(Title) AS 'Count'
FROM titles
JOIN dept_emp ON titles.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE titles.to_date LIKE '9999%' AND departments.dept_name = 'Customer Service'
GROUP BY Title
ORDER BY TITLE ASC;

-- Q5: Find the current salary of all current managers.
SELECT departments.dept_name AS 'Department Name',
	CONCAT(employees.first_name, ' ', employees.last_name) AS 'Name',
    salaries.salary AS 'Salary'
FROM salaries
JOIN employees ON salaries.emp_no = employees.emp_no
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE salaries.to_date LIKE '9999%' and dept_manager.to_date LIKE '9999%'
ORDER BY departments.dept_name ASC;

-- Q6: Find the number of current employees in each department.


-- Q7: Which department has the highest average salary? Hint: Use current not historic information.


-- Q8: Who is the highest paid employee in the Marketing department?


-- Q9: Which current department manager has the highest salary?


-- Q10: Determine the average salary for each department. Use all salary information and round your results.


-- Q11:Bonus Find the names of all current employees, their department name, and their current manager's name.


-- Q12: Bonus Who is the highest paid employee within each department.

