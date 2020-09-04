-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
CREATE VIEW employee_info AS
SELECT employees.emp_no AS "Employee Number", 
last_name AS "Last Name", 
first_name AS "First Name", 
sex AS "Sex", salaries.salary AS "Salary" 
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
CREATE VIEW hired_1986 AS
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
CREATE VIEW  dept_managers AS
SELECT employees.last_name AS "Manager Last Name",
employees.first_name AS "Manager First Name",
departments.dept_no AS "Department #",
departments.dept_name AS "Department Name",
dept_manager.emp_no AS "Department Manager #"
FROM departments
INNER JOIN dept_manager ON
departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
CREATE VIEW  emp_depart AS
SELECT employees.emp_no AS "Employee Number",
employees.last_name AS "Employee Last Name",
employees.first_name AS "Employee First Name",
departments.dept_name AS "Department Name"
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
CREATE VIEW Hercules AS
SELECT first_name AS "First Name",
last_name AS "Last Name",
sex AS "Gender"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
CREATE VIEW sales_dept AS
SELECT departments.dept_name AS "Department Name",
departments.dept_no AS "Department Number",
dept_emp.emp_no AS "Employee Number",
employees.last_name AS "Last Name",
employees.first_name AS "First Name"
FROM departments
INNER JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON
dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW sales_and_dev_dept AS
SELECT departments.dept_name AS "Department Name",
departments.dept_no AS "Department Number",
dept_emp.emp_no AS "Employee Number",
employees.last_name AS "Last Name",
employees.first_name AS "First Name"
FROM departments
INNER JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON
dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales' or departments.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
CREATE VIEW count_last_name AS
SELECT last_name, COUNT(last_name) FROM employees AS "Last Names"
GROUP BY last_name
ORDER BY last_name DESC;

-- For the bonus 
CREATE VIEW salary_by_title AS
SELECT titles.title AS "Position Titles",
AVG(salaries.salary) AS "Average Salary"
FROM titles
INNER JOIN employees
ON titles.title_id = employees.emp_title_id
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no
GROUP BY titles.title
