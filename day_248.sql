


Questions : Write an SQL query to find the missing customer IDs. The missing IDs are those that are not present in the Customers table but are within the range 
            from 1 to the maximum customer_id in the table.


CREATE TABLE Customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100) );



INSERT INTO Customers (customer_id, customer_name) 
VALUES
(1, 'Alice'),
(4, 'Bob'),
(5, 'Charlie');


with recursive re_seq as (
select 1 as id 
union all 
select id + 1 
from re_seq
where id < (select max(customer_id) from Customers))
select id from re_seq
where id  not in (select customer_id from Customers);
