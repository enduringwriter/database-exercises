/*
Keith Stateson
SQL Exercise 11: temporary tables
*/

SHOW DATABASES;
USE employees;

SHOW GRANTS;

SELECT DATABASE();
SHOW TABLES;

DESCRIBE departments; -- dept_no, dept_name
DESCRIBE dept_emp; -- emp_no, dept_no, from_date, to_date
DESCRIBE dept_manager; -- emp_no, dept_no, from_date, to_date
DESCRIBE employees; -- emp_no, birth_date, first_name, last_name, gender, hire_date
DESCRIBE salaries; -- emp_no, salary, from_date, to_date
DESCRIBE titles; -- emp_no, title, from_date, to_date


-- ==========================================
-- Q1: Using the example from the lesson, create a temporary table called employees_with_departments that 
-- contains first_name, last_name, and dept_name for employees currently with that department. 
-- Be absolutely sure to create this table on your own database.
-- If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.

CREATE TEMPORARY TABLE oneil_2094.employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees
JOIN dept_emp USING (emp_no)
JOIN departments USING (dept_no)
WHERE dept_emp.to_date LIKE '9999%'
LIMIT 10;

USE oneil_2094;
SELECT * FROM employees_with_departments LIMIT 10;


-- ==========================================
-- Q1a: Add a column named full_name to this table.
-- It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.

SELECT MAX(LENGTH(CONCAT(first_name, last_name))) + 1 FROM employees;

ALTER TABLE employees_with_departments ADD full_name VARCHAR (30);


-- ==========================================
-- Q1b: Update the table so that the full_name column contains the correct data.
UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name)
LIMIT 10;


-- ==========================================
-- Q1c: Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments DROP COLUMN first_name, DROP COLUMN last_name;


-- ==========================================
-- Q1b: What is another way you could have ended up with this same table?
SELECT dept_name, full_name FROM employees_with_departments
LIMIT 10;


-- ==========================================
-- Q2: Create a temporary table based on the payment table from the sakila database.
-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment.
-- For example, 1.99 should become 199.
USE sakila;
SHOW TABLES;
-- actor,actor_info,address,category,city,country,customer,customer_list,film,film_actor,film_category,film_list,
-- film_text,inventory,language,nicer_but_slower_film_list,payment,rental,sales_by_film_category,sales_by_store,staff,staff_list,store
SELECT * FROM payment LIMIT 10;
DESCRIBE payment;  -- payment_id, customer_id, staff_id, rental_id, amount, payment_date, last_update

DROP TABLE IF EXISTS oneil_2094.payments; -- only drop the table if it exists, it not, no error (also restarting mysql erases temp tables)

CREATE TEMPORARY TABLE oneil_2094.payments
SELECT 
FROM sakila






-- ==========================================
-- Q3: Find out how the current average pay in each department compares to the overall current pay for everyone at the company.
-- For this comparison, you will calculate the z-score for each salary.
-- In terms of salary, what is the best department right now to work for? The worst?

