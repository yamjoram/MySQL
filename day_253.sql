

Questions : Find the most common domain (excluding the www. prefix) used in email addresses from the users table. 
            Output the domain and the number of occurrences, ordered by the count in descending order.






CREATE TABLE users (
user_id INT PRIMARY KEY,
email VARCHAR(255) );

INSERT INTO users (user_id, email) VALUES
(1, 'john.doe@google.com'),
(2, 'jane.smith@www.gmail.com'), 
(3, 'alice.jones@yahoo.com'),
(4, 'bob.brown@google.com'),
(5, 'carol.taylor@www.yahoo.com'),
(6, 'david.wilson@google.com'), 
(7, 'emily.miller@www.gmail.com'), 
(8, 'michael.davis@google.com'), 
(9, 'susan.martin@yahoo.com'), 
(10, 'jackson.lee@google.com');

select replace(substring_index(email,"@",-1),"www.","") as email_prefix, count(*) as occurance_cnt
from users
group by 1
order by 2 desc;
