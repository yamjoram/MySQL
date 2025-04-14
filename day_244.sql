

Questions : Write an SQL query to standardize the Country column in the Customers table, ensuring all instances of 'United Kingdom', 'UK', and 'GB' are replaced with 'United Kingdom'.




CREATE TABLE Customers (
CustomerID INT,
CustomerName VARCHAR(255), 
Country VARCHAR(255)
);




INSERT INTO Customers (CustomerID, CustomerName, Country) VALUES
(1, 'John Doe', 'United Kingdom'),
(2, 'Jane Smith', 'UK'),
(3, 'Rajesh Kumar', 'GB'),
(4, 'Neha Gupta', 'India'),
(5, 'Ravi Mehra', 'United Kingdom'),
(6, 'Kavita Reddy', 'GB');


update Customers
set Country = case when Country in ("United Kingdom", "UK", "GB") then "United Kingdom"
              else Country end;
