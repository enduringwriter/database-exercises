SHOW DATABASES;
USE employees;
SHOW TABLES;
DESCRIBE employees;
-- data types include: int, date, and string (varchar and enum)
-- Q6 Which table(s) do you think contain a numeric type column?
-- A6 emp_no (which likely stands for employee number)
-- Q7 Which table(s) do you think contain a string type column?
-- A7 first_name and last_name
-- Q8 Which table(s) do you think contain a date type column?
-- Q8 birth_date and hire_date
DESCRIBE departments;
-- Q9 What is the relationship between the employees and the departments tables?
-- A9 employees is a db while departments is a table, and employees needs to be specified as it can be the db or the table
SHOW CREATE TABLE dept_manager;