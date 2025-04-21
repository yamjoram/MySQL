

Questions : Write an SQL query to find the second-highest salary of employees in the Engineering department. The query should retrieve the second-highest salary for
            employees specifically in the Engineering department.





CREATE TABLE departments (
department_id INT PRIMARY KEY,
department_name VARCHAR(50) );

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Engineering'),
(2, 'Sales'),
(3, 'Marketing');

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
department_id INT,
salary DECIMAL(10, 2),
FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


INSERT INTO employees  (employee_id, department_id, salary) VALUES
(1, 1, 60000.00), 
(2, 1, 75000.00), 
(3, 1, 80000.00), 
(4, 2, 50000.00), 
(5, 2, 55000.00),
(6, 3, 45000.00);

select employee_id, salary from (
select d.department_id, d.department_name, e.salary, employee_id, 
      dense_rank() over(partition by d.department_id order by e.salary desc) as rnk 
from departments d 
left join employees e 
  on e.department_id = d.department_id
where d.department_name = "Engineering") as sub
where rnk = 2;
