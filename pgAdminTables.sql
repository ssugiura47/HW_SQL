CREATE TABLE titles(
	title_id VARCHAR(30) PRIMARY KEY,
	title VARCHAR(30) NOT NULL
	);

CREATE TABLE employees(
	emp_no VARCHAR(10) PRIMARY KEY,
	emp_title_id VARCHAR(30) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(5),
	hire_date DATE NOT NULL
	);

CREATE TABLE salaries(
	emp_no VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL
	);

CREATE TABLE departments(
	dept_no VARCHAR(10) PRIMARY KEY, 
	dept_name VARCHAR(30) NOT NULL
	);

CREATE TABLE dept_manager(
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);

CREATE TABLE dept_emp(
	emp_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);