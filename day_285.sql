


Questions : Find all customer names whose email addresses contain a domain from a specific list of domains (e.g., gmail.com, yahoo.com, outlook.com). 
            Output the customer name and email address.



CREATE TABLE customers (
customer_id INT PRIMARY KEY, 
customer_name VARCHAR(100), 
email VARCHAR(100)
);

INSERT INTO customers (customer_id, customer_name, email) VALUES
(1, 'Alice', 'alice@gmail.com'),
(2, 'Bob', 'bob@yahoo.com'),
(3, 'Charlie', 'charlie@hotmail.com'), 
(4, 'David', 'david@outlook.com'),
(5, 'Eve', 'eve@gmail.com'),
(6, 'Frank', 'frank@outlook.com'), 
(7, 'Grace', 'grace@yahoo.com'),
(8, 'Hannah', 'hannah@aol.com'), 
(9, 'Ian', 'ian@gmail.com'),
(10, 'Jack', 'jack@yahoo.com');


select customer_name, email
from customers 
where email regexp '@(gmail\\.com|yahoo\\.com|outlook\\.com)$';
