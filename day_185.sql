CREATE TABLE UserLogins (
UserID INT PRIMARY KEY,
LastLoginDate DATE);

INSERT INTO UserLogins VALUES
(1, '2023-12-01'), 
(2, '2024-01-05'),
(3, '2023-10-15'),
(4, '2023-11-23'), 
(5, '2024-01-01');

Questions : You need to find the number of days since each user last logged in based on the LastLoginDate column. 
            This should be calculated from the current date, taking into account the system's current date.

select UserID,current_date(), LastLoginDate, datediff(current_date(), LastLoginDate) as diff
from UserLogins;
