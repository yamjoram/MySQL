


Questions : Write a SQL query to get the average review ratings for every product every month. The output should include the month in numerical value, product id, and 
            average star rating rounded to two decimal places. Sort the output based on the month followed by the product id.



CREATE TABLE reviews (
review_id INT PRIMARY KEY, 
user_id INT,
submit_date TIMESTAMP,
product_id INT,
stars INT );


INSERT INTO reviews (review_id, user_id, submit_date, product_id, stars) VALUES
(6171, 123, '2022-06-08 00:00:00', 50001, 4),
(7802, 265, '2022-06-10 00:00:00', 69852, 4),
(5293, 362, '2022-06-18 00:00:00', 50001, 3),
(6352, 192, '2022-07-26 00:00:00', 69852, 3),
(4517, 981, '2022-07-05 00:00:00', 69852, 2);


select extract(month from submit_date) as month, product_id, avg(stars) as avg_rating
from reviews
group by 1, 2
order by 1, 2;
