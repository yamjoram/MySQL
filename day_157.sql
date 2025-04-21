


Questions : Write a SQL query to find the highest-grossing items. Identify the top two highest-grossing products within each category in 2022. Output the category, product, 
            and total spend.


CREATE TABLE product_spend (
category VARCHAR(50), 
product VARCHAR(50), 
user_id INT,
spend DECIMAL(10, 2),
transaction_date TIMESTAMP
);


INSERT INTO product_spend (category, product, user_id, spend, transaction_date) VALUES
('appliance', 'refrigerator', 165, 246.00, '2021-12-26 12:00:00'), 
('appliance', 'refrigerator', 123, 299.99, '2022-03-02 12:00:00'), 
('appliance', 'washing machine', 123, 219.80, '2022-03-02 12:00:00'), 
('electronics', 'vacuum', 178, 152.00, '2022-04-05 12:00:00'), 
('electronics', 'wireless headset', 156, 249.90, '2022-07-08 12:00:00'), 
('electronics', 'vacuum', 145, 189.00, '2022-07-15 12:00:00');



select category, product, total_spend from (
select category, product, sum(spend) as total_spend, 
        dense_rank() over(partition by category order by sum(spend) desc ) as rnk 
from product_spend
where extract(year from transaction_date) = "2022"
group by 1, 2) as sub
where rnk <= 2;
