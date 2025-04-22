

Questions : Write an SQL query to determine which manager oversees the largest team. The employees table contains employee_id, manager_id, and department_id. 
            Your task is to find the manager_id and the team size (the number of employees they manage).


 CREATE TABLE employees (
employee_id INT PRIMARY KEY, 
manager_id INT, 
department_id INT
);

INSERT INTO employees (employee_id, manager_id, department_id) VALUES
    (1, 3, 1),
    (2, 3, 1),
    (3, NULL, 1),
    (4, 3, 1),
    (5, 4, 2),
    (6, 4, 2),
    (7, 4, 2),
    (8, 4, 2),
    (9, 5, 2),
    (10, 5, 2);
    
    
select manager_id, count(employee_id) as total_team 
from employees
group by 1
order by 2 desc 
limit 1;
