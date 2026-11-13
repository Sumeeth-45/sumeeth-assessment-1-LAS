CREATE DATABASE company_management;
USE company_management;

-- TABLE 1: DEPARTMENTS

CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales'),
(6, 'Operations'),
(7, 'Support');

-- TABLE 2: EMPLOYEES

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    age INT,
    salary INT,
    dept_id INT,
    joining_date DATE
);

INSERT INTO employees VALUES
(101, 'Rahul', 25, 35000, 1, '2023-01-15'),
(102, 'Priya', 28, 45000, 2, '2022-05-20'),
(103, 'Arjun', 30, 55000, 1, '2021-03-10'),
(104, 'Sneha', 24, 30000, 3, '2024-07-01'),
(105, 'Kiran', 32, 60000, 4, '2020-11-25'),
(106, 'Ayesha', 27, 40000, 2, '2023-09-12'),
(107, 'Vikram', 29, 50000, 5, '2022-06-18'),
(108, 'Neha', 26, 38000, 3, '2024-02-05'),
(109, 'Amit', 31, 65000, 1, '2020-08-14'),
(110, 'Pooja', 23, 28000, 6, '2025-01-10');

-- TABLE 3: PROJECTS

CREATE TABLE projects (
    project_id INT,
    project_name VARCHAR(50),
    emp_id INT,
    budget INT,
    start_date DATE
);

INSERT INTO projects VALUES
(201, 'AI Project', 101, 50000, '2025-01-10'),
(202, 'HR Portal', 102, 30000, '2025-02-15'),
(203, 'Data Analytics', 103, 80000, '2025-03-20'),
(204, 'Finance System', 104, 45000, '2025-04-05'),
(205, 'Marketing App', 105, 60000, '2025-05-12'),
(206, 'ML Project', 101, 90000, '2025-06-18'),
(207, 'Cloud Migration', 107, 75000, '2025-07-22'),
(208, 'Support Portal', 108, 25000, '2025-08-10'),
(209, 'Sales Dashboard', 103, 55000, '2025-09-15'),
(210, 'Automation System', 109, 100000, '2025-10-20');

-- Q1. The HR department wants to shortlist employees.
-- a) Display employee names, ages and salaries.

select 
emp_name , 
age , 
salary 
from employees;

-- b) Find employees earning more than ₹40,000.
select * from employees
where salary > 40000;

-- c) Find employees whose age is between 25 and 30.
select * from employees
where age between 25 and 30 ;

-- d) Find employees whose names start with the letter 'A'
select * from employees
where emp_name like "A%";

-- Q2.  The management wants to analyse employee records.
-- a) Display employees in descending order of salary. 
select * 
from employees 
order by salary desc;

-- b) Display employees in ascending order of joining date. 
select *
from employees
order by joining_date asc;

--  Display unique department IDs from the employees table.
select distinct dept_id 
from employees;

-- Q3. The HR team wants to generate a salary summary. 
-- a) Find the total number of employees.
select count(emp_name) as total_employees 
from employees;

-- Calculate the total salary paid to all employees.
select sum(salary) as total_salary
from employees;

-- Find the highest and lowest salaries.
select max(salary) as highest_salary
from employees;
select min(salary) as lowest_salary 
from employees;
select max(salary) as highest_salary , min(salary) as lowest_salary 
from employees;

-- d) Calculate the average salary. 
select avg (salary) as average_salary 
from employees;

-- Q4. The management wants to compare employee distribution across departments
-- a) Find the number of employees in each department.
select 
 departments.dept_name,
 count(*) as total_employees
 from departments
 group by departments.dept_name;
-- Calculate the average salary of each department.
select dept_id , avg(salary) as Average_salary 
from employees 
group by dept_id ;

-- c) Display department IDs having an average salary greater than ₹40,000.

select dept_id , avg(salary) as average_salary 
from employees 
group by dept_id 
having avg(salary) > 40000;

-- Q5. Project Budget Analysis
-- a) Display projects with budgets greater than ₹50,000. 
select * 
from projects 
where budget > 50000;

-- b) Calculate the total project budget.
select 
sum(budget) as total_project_budget 
from projects;

-- c) Calculate the average project budget.
select 
avg(budget) as Average_project_budget 
from projects;

-- d) Find the number of projects assigned to each employee.
select
    employees.emp_name,
    COUNT(projects.project_id) as total_projects
from employees
left join projects 
on  employees.emp_id = projects.emp_id
group by employees.emp_id, employees.emp_name;

 -- Q6. Employee Details 
 -- a) Display employee names and their department names using INNER JOIN.
 SELECT employees.emp_name, departments.dept_name
FROM employees
INNER JOIN departments
ON employees.dept_id = departments.dept_id;

-- b) Display employee names and their project names using LEFT JOIN.
select employees.emp_name , projects.project_name
from employees
left join projects
on employees.emp_id = projects.emp_id;