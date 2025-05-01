
Questions : Find the most common combination of department and salary in the employees table. 
            Output the department, salary, and the number of employees in that combination, ordered by the count in descending order.

CREATE TABLE employees (
employee_id INT PRIMARY KEY, 
department VARCHAR(50), 
salary INT
);

INSERT INTO employees (employee_id, department, salary) VALUES
(1, 'HR', 50000),
(2, 'IT', 60000),
(3, 'IT', 60000),
(4, 'Finance', 70000), 
(5, 'HR', 50000),
(6, 'IT', 75000), 
(7, 'HR', 50000),
(8, 'Finance', 70000), 
(9, 'Sales', 60000), 
(10, 'Finance', 70000);


select department, salary, count(*) as num_of_employees 
from employees
group by 1, 2
order by 3 desc;
