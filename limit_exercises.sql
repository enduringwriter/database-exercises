/*
Keith Stateson
SQL Exercise 5: limit_exercises
Codeup
Note, the Answer is simply the command below the Question
*/

USE employees;
DESCRIBE employees;
SELECT * FROM employees LIMIT 1;

-- Q2: List the first 10 distinct last name sorted in descending order.
SELECT DISTINCT last_name FROM employees LIMIT 10;

-- Q3: Find all employees hired in the 90s and born on Christmas.
-- Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records.
-- Write a comment in your code that lists the five names of the employees returned.
-- Employee names: Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, Petter Stroustrup
SELECT * FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%-12-25' ORDER BY hire_date LIMIT 5;

-- Q4: Update the query to find the tenth page of results. If every page has five employees.
SELECT * FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%-12-25' ORDER BY hire_date LIMIT 5 OFFSET 45;
