



Questions : Write an SQL query to insert a new employee into the Employees table with the following details:
            • FirstName: 'Michael'
            • LastName: 'Taylor'
            • JobTitle: 'UX Designer' • HireDate: '2023-01-15'



CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY AUTO_INCREMENT, 
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
JobTitle VARCHAR(100),
    HireDate DATE
);


INSERT INTO Employees (FirstName, LastName, JobTitle, HireDate) VALUES
('John', 'Doe', 'Software Engineer', '2021-05-01'), 
('Jane', 'Smith', 'Data Analyst', '2020-07-15');


insert into Employees (FirstName, LastName, JobTitle, HireDate)
VALUES ("Michael", "Taylor", "UX Designer", "2023-01-15");
