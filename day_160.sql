

Questions : Write a SQL query to determine the daily aggregate count of new users and the cumulative count of users over time. 
            You are given a users table with the columns user_id and registration_date. The task is to generate a report showing:
            • The daily count of new users (new_users).
            • The cumulative count of users (cumulative_count) up to each registration date. The results should be ordered by registration_date.
            

CREATE TABLE users (
user_id INT PRIMARY KEY,
registration_date DATE );

INSERT INTO users (user_id, registration_date) VALUES
(1, '2024-01-01'), (2, '2024-01-01'),
(3, '2024-01-02'), (4, '2024-01-02'), 
(5, '2024-01-03'), (6, '2024-01-03'),
(7, '2024-01-03'), (8, '2024-01-04'), 
(9, '2024-01-04'), (10, '2024-01-04');



select registration_date, count(user_id) as num_of_registered,
sum(count(user_id)) over(order by registration_date) as cumulative_cnt
from users
group by 1;
