

Questions : Write an SQL query to find the most frequently ordered product(s) for each customer. Return the product_id and product_name for each customer_id who ordered at 
            least one product. If there are multiple most frequently ordered products for a customer, return all of them. The result table should be ordered by customer_id.





CREATE TABLE Customers (
customer_id INT PRIMARY KEY,
name VARCHAR(100) );

CREATE TABLE Orders ( 
order_id INT PRIMARY KEY, 
order_date DATE, 
customer_id INT, 
product_id INT
);

CREATE TABLE Products ( 
product_id INT PRIMARY KEY, 
product_name VARCHAR(100), 
price INT
);

INSERT INTO Customers (customer_id, name) VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Tom'),
    (4, 'Jerry'),
    (5, 'John');
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES
(1, '2020-07-31', 1, 1), (2, '2020-07-30', 2, 2), (3, '2020-08-29', 3, 3), 
(4, '2020-07-29', 4, 1), (5, '2020-06-10', 1, 2), (6, '2020-08-01', 2, 1),
(7, '2020-08-01', 3, 3), (8, '2020-08-03', 1, 2), (9, '2020-08-07', 2, 3),
(10, '2020-07-15', 1, 2);

INSERT INTO Products (product_id, product_name, price) VALUES
(1, 'keyboard', 120),
(2, 'mouse', 80),
(3, 'screen', 600),
(4, 'hard disk', 450);

select customer_id, name, product_id, product_name, cnt from (
select c.customer_id, c.name, p.product_id, p.product_name,
  count(o.customer_id) as cnt, 
  dense_rank() over(partition by c.customer_id order by count(o.customer_id) desc) as rnk
  from Customers c 
left join Orders o 
  on o.customer_id = c.customer_id
left join Products p 
  on p.product_id = o.product_id
where p.product_id is not null
group by 1, 2, 3, 4
) as sub
where rnk = 1;
