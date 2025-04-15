


Questions : Write an SQL query to delete all customer records from the Customers table where the Email column contains an invalid domain, such as 'example.com' or 'fake.com'.


CREATE TABLE Customers (
CustomerID INT, 
CustomerName VARCHAR(255),
Email VARCHAR(255)
);


INSERT INTO Customers (CustomerID, CustomerName, Email) VALUES
(1, 'John Doe', 'john.doe@example.com'),
(2, 'Jane Smith', 'jane.smith@gmail.com'),
(3, 'Rajesh Kumar', 'rajesh.kumar@fake.com'),
(4, 'Neha Gupta', 'neha.gupta@yahoo.com'),
(5, 'Ravi Mehra', 'ravi.mehra@example.com');



delete c  
from Customers c
where Email like "%@example.com" or Email like "%@fake.com";
