


Questions : Write an SQL query to show the second most recent activity of each user. If the user only has one activity, return that one.


CREATE TABLE UserActivity (
username VARCHAR(100), 
activity VARCHAR(100), 
startDate DATE, endDate DATE
);




INSERT INTO UserActivity (username, activity, startDate, endDate) VALUES
('Alice', 'Travel', '2020-02-12', '2020-02-20'),
('Alice', 'Dancing', '2020-02-21', '2020-02-23'), 
('Alice', 'Travel', '2020-02-24', '2020-02-28'),
('Bob', 'Travel', '2020-02-11', '2020-02-18');



with cte as (
select username, activity, startDate, endDate, 
dense_rank() over(partition by username order by startDate desc) as rnk 
from UserActivity)
select * from cte where rnk = 2
union all 
select * from (
select username, activity, startDate, endDate, 
dense_rank() over(partition by username order by startDate desc) as rnk 
from UserActivity) as sub
where rnk = 1 and username not in (select username from cte where rnk = 2);
