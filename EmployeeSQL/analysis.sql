-- Database: sql-challenge

-- DROP DATABASE IF EXISTS "sql-challenge";

CREATE DATABASE "sql-challenge"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
--******************************************* DATA ANALYSIS *********************************************

--1. List the employee number, last name, first name, sex, and salary of each employee in a query
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no=employees.emp_no;

--2. List the first name, last name, and hire date for employees hired in 1986
SELECT employees.first_name, employees.last_name, employees.hire_date FROM EMPLOYEES
WHERE hire_date LIKE '%1986';

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name 
FROM departments
INNER JOIN dept_manager ON
departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;

--4. List the department number for each employeee along with that employee's numbeer, last name, first name, and department name
SELECT dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
FULL JOIN employees ON
dept_emp.emp_no=employees.emp_no
FULL JOIN departments ON
dept_emp.dept_no=departments.dept_no;

--5. List first name, last name, and sex of each employee, first name = Hercules and last name starts with B
SELECT employees.first_name, employees.last_name, employees.sex FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

--6. List each employee in the Sales Department, including employee number, last name, and first name
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no='d007'
);

--7. List each employee in the sales and development departments, including employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name,departments.dept_name
FROM employees AS e
INNER JOIN dept_emp
ON e.emp_no=dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE e.emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no='d007' OR dept_no='d005'
);

--8. List the frequency counts, in descending order, of all the employee last names
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;



