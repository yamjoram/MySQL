
Questions : Write a query to find the number of students majoring in each department. Include all departments, even those with no students. 
            Sort the result by the number of students in descending order, and in case of ties, alphabetically by the department name.


CREATE TABLE student (
student_id INT PRIMARY KEY, 
student_name VARCHAR(255), 
gender CHAR(1),
dept_id INT
);

CREATE TABLE department ( 
dept_id INT PRIMARY KEY, 
dept_name VARCHAR(255)
);

INSERT INTO student (student_id, student_name, gender, dept_id) VALUES
(1, 'Jack', 'M', 1),
(2, 'Jane', 'F', 1),
(3, 'Mark', 'M', 2);

INSERT INTO department (dept_id, dept_name) VALUES
(1, 'Engineering'), 
(2, 'Science'),
(3, 'Law');


select d.dept_id, d.dept_name, count(s.student_id) as num_of_student
from department d 
left join student s 
on s.dept_id = d.dept_id
group by 1, 2 
order by 3 desc, 2;
