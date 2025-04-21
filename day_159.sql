


Questions : Write a SQL query to generate a histogram showing the count of comments made by each user. You are given two tables, users and comments. The users table contains information 
            about users, and the comments table contains comments made by users. The task is to calculate the number of comments each user has made and sort the results in descending 
            order of comment count to identify the most active users.

CREATE TABLE users (
user_id INT PRIMARY KEY,
name VARCHAR(100) );

CREATE TABLE comments (
comment_id INT PRIMARY KEY,
user_id INT,
comment_text TEXT,
FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users 
(user_id, name) VALUES
(1, 'Alice'), (2, 'Bob'),
(3, 'Charlie'), (4, 'David');

INSERT INTO comments (comment_id, user_id, comment_text) VALUES
(1, 1, 'Great product!'),
(2, 2, 'I really like this.'),
(3, 1, 'Could be better.'),
(4, 3, 'Not satisfied.'),
(5, 1, 'Excellent service.'),
(6, 2, 'Could use some improvements.'), 
(7, 4, 'Fast delivery.'),
(8, 3, 'Highly recommend.'),
(9, 1, 'Will buy again.'),
(10, 2, 'Good value for money.');

select u.user_id, u.name, count(c.comment_id) as cnt 
from users u 
left join comments c 
  on c.user_id = u.user_id 
group by 1, 2
order by 3 desc;
