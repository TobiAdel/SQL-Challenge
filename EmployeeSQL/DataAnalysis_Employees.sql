-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees
Join salaries on employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
order by hire_date asc

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT employees.emp_no, employees.first_name, employees.last_name, dept_manager.dept_no, departments.dept_name
FROM employees
Join dept_manager on employees.emp_no = dept_manager.emp_no
Join  departments on dept_manager.dept_no = departments.dept_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name,departments.dept_name
FROM employees
Join dept_emp on employees.emp_no =dept_emp.emp_no
Join departments on dept_emp.dept_no = departments.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name,departments.dept_name
FROM employees
Join dept_emp on employees.emp_no =dept_emp.emp_no
Join departments on dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name,departments.dept_name
FROM employees
Join dept_emp on employees.emp_no =dept_emp.emp_no
Join departments on dept_emp.dept_no = departments.dept_no
WHERE dept_name in('Sales', 'Development')

-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT last_name,COUNT(*) AS frequency 
FROM employees 
GROUP BY last_name HAVING COUNT(*)>1
ORDER BY frequency Desc