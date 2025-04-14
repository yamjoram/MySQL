

Questions : Write an SQL query to find and update all PhoneNumber values in the Customers table that do not follow the standard UK phone format (i.e., must start with +44 
            and be 11 digits long) to 'Invalid'.



CREATE TABLE Customers (
CustomerID INT, 
CustomerName VARCHAR(255), 
PhoneNumber VARCHAR(20)
);

INSERT INTO Customers (CustomerID, CustomerName, PhoneNumber) 
VALUES
(1, 'Amit Sharma', '+441234567890'), 
(2, 'Priya Patel', '+442345678901'), 
(3, 'Rajesh Kumar', '1234567890'), 
(4, 'Neha Gupta', '+44345678901'),
(5, 'Ravi Mehra', '9876543210'),
(6, 'Kavita Reddy', '+4412345678');


update Customers 
set PhoneNumber = "Invalid"
where PhoneNumber not regexp "^\\+44[0-9]{9}$";
