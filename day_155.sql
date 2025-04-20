




Questions : Write an SQL query to calculate the total transaction amount for each customer for the 2024 year. The output should contain Customer_Name and the total amount.



CREATE TABLE Customers (
Customer_id INT PRIMARY KEY, 
Customer_Name VARCHAR(100), 
Registration_Date DATE
);

CREATE TABLE Transaction (
Transaction_id INT PRIMARY KEY,
Customer_id INT, 
Transaction_Date DATE,
Amount DECIMAL(10, 2),
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id) );


INSERT INTO Customers (Customer_id, Customer_Name, Registration_Date) VALUES
(1, 'John Doe', '2023-01-15'),
(2, 'Jane Smith', '2023-02-20'),
(3, 'Michael Johnson', '2023-03-10');



INSERT INTO Transaction (Transaction_id, Customer_id, Transaction_Date, Amount) VALUES
(201, 1, '2024-01-20', 50.00), 
(202, 1, '2024-02-05', 75.50),
(203, 2, '2023-02-22', 100.00),
(204, 3, '2022-03-15', 200.00), 
(205, 2, '2024-03-20', 120.75),
(301, 1, '2024-01-20', 50.00), 
(302, 1, '2024-02-05', 75.50), 
(403, 2, '2023-02-22', 100.00), 
(304, 3, '2022-03-15', 200.00), 
(505, 2, '2024-03-20', 120.75);


select c.Customer_id, c.Customer_Name, sum(t.Amount) as total_transaction_amount
from Customers c 
left join Transaction t 
  on t.Customer_id = c.Customer_id
where extract(year from t.Transaction_Date) = "2024"
group by 1, 2 
order by 3 desc
