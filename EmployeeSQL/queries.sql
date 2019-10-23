-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary
-- Join employees and salary tables
-- drop view employee_specs
create view employee_specs as
select employees.emp_no, 
 employees.first_name, 
 employees.last_name, 
 employees.gender,
 salaries.from_date,
 salaries.salary
from employees
join salaries on
employees.emp_no = salaries.emp_no;

-- List data specified in question 1 with an alias
select emp_no as "Employee Number",
 first_name as "First Name",
 last_name as "Last Name", 
 gender as "Gender",
 salary as "Salary",
 from_date as "From Date"
from employee_specs;

-- 2. List and create an alias for employees who were hired in 1986
select emp_no as "Employee Number",
first_name as "First Name",
last_name as "Last_Name",
hire_date as "Hire Date" 
from employees
WHERE
      hire_date >= '1986-01-01'
  AND hire_date <  '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates
-- Join dept_manager with departments table
-- drop view manager_build
create view manager_build as
select dept_manager.dept_no,
 departments.dept_name,
 dept_manager.emp_no,
 dept_manager.from_date,
 dept_manager.to_date
from dept_manager
join departments on
dept_manager.dept_no = departments.dept_no;

--Join manager_buld view with employees table and include an alias for each
-- drop view manager_specs
create view manager_specs as
select manager_build.emp_no as "Employee Number",
 employees.first_name as "First Name",
 employees.last_name as "Last Name",
 manager_build.dept_no as "Department Number",
 manager_build.dept_name as "Department Name",
 manager_build.from_date as "From Date",
 manager_build.to_date as "To Date"
from manager_build
join employees on
manager_build.emp_no = employees.emp_no;

select * from manager_specs;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name
-- Join the employees and dept_employees tables
-- drop view employee_build
create view employee_build as
select employees.emp_no,
 employees.last_name,
 employees.first_name,
 dept_employees.dept_no
from employees
join dept_employees on
employees.emp_no = dept_employees.emp_no;

-- Join the employee_build and departments tables and include alias for each
-- drop view dept_specs
create view dept_specs as
select employee_build.emp_no as "Employee Number",
 employee_build.last_name as "Last Name",
 employee_build.first_name as "First Name",
 departments.dept_name as "Department Name"
from employee_build
join departments on
employee_build.dept_no = departments.dept_no;

select * from dept_specs;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name from employees
where first_name = 'Hercules' and last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name
-- Create view of Sales department employees
-- drop view sales_dept
create view sales_dept as
select "Employee Number", 
 "Last Name", 
 "First Name", 
 "Department Name"
from dept_specs
where "Department Name" = 'Sales';

select * from sales_dept;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
-- Create view of Sale and Development department employees
-- drop view sales_dev
create view sales_dev as
select "Employee Number", 
 "Last Name", 
 "First Name", 
 "Department Name"
from dept_specs
where "Department Name" = 'Sales' 
or "Department Name" = 'Development'
order by "Department Name" asc;

select * from sales_dev;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
--drop view last_names
create view last_names as
select "Last Name", count ("Last Name") as "Frequency"
from dept_specs
group by "Last Name"
order by "Frequency" desc;

select * from last_names;
