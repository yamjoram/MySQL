CREATE TABLE Employees ( 
EmployeeID INT,
EmployeeName VARCHAR(100),
HireDate DATE,
Salary DECIMAL(10, 2)
);

INSERT INTO Employees VALUES
(1, 'John Doe', '2018-03-01', 50000),
(2, 'Alice Smith', '2021-06-15', 45000), 
(3, 'Bob Brown', '2017-09-20', 60000),
(4, 'Charlie Davis', '2019-11-01', 55000), 
(5, 'Eve Harris', '2022-01-10', 40000),
(6, 'Frank Black', '2020-05-15', 48000),
(7, 'Grace White', '2015-12-12', 70000);


Questions : For each employee, determine if they are eligible for a salary increase based on their years of service. 
            If an employee has been with the company for 5 years or more, they are eligible for a '10% Increase'. 
            If they have been with the company for less than 5 years but more than 2 years, 
            they are eligible for a '5% Increase'. Employees with less than 2 years are not eligible for any increase.

  
select EmployeeName,
    extract(year from current_date()) as cur_year, extract(year from HireDate) as join_date,
    extract(year from current_date()) - extract(year from HireDate) as year_diff,
    case when extract(year from current_date()) - extract(year from HireDate) >= 5 then "10% Increase"
    when extract(year from current_date()) - extract(year from HireDate) < 5 and 
     extract(year from current_date()) - extract(year from HireDate) > 2 then "5% Increase"
     else "Not eligible" end as Salary_status
    
from Employees;
