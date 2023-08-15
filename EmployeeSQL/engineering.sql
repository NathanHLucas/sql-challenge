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
	
	
	
-- ********************************** DATA ENGINEERING ***************************************	
-- create tables to match all .csv files (departments, dept_emp, dept_manager,employees, salaries, titles)

--create and import departments table
DROP TABLE departments;
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(25) NOT NULL,
	PRIMARY KEY(dept_no)
);

--check to see departments was imported correctly
SELECT * FROM departments;


--create and import dept_manager table
DROP TABLE dept_manager;
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--check to see dept_manager was imported correctly
SELECT * FROM dept_manager;


--create and import dept_emp table
DROP TABLE dept_emp;
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

--check to see dept_emp was imported correctly
SELECT * FROM dept_emp;

--add composite key to dept_emp table since there is duplicate emp_no in dept_emp
ALTER TABLE dept_emp
ADD PRIMARY KEY (emp_no, dept_no);

--check to see dept_emp was imported correctly
SELECT * FROM dept_emp;

--create and import titles table
DROP TABLE titles;
CREATE TABLE titles(
	title_id VARCHAR(5),
	title VARCHAR(20),
	PRIMARY KEY(title_id)
);

--check to see titles was imported correctly
SELECT * FROM titles


--create and import employees table
DROP TABLE employees;
CREATE TABLE employees(
	emp_no INT NOT NULL,
	PRIMARY KEY (emp_no),
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date VARCHAR(10),
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex VARCHAR(1),
	hire_date VARCHAR(10),
	FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
);

--check to see employees was imported correctly
SELECT * FROM employees;

--create and import salaries table
DROP TABLE salaries;
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT, 
	PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

--check to see salaries was imported correctly
SELECT * FROM salaries;

