
Questions : Write an SQL query to report the current credit balance for each user after processing all transactions, and check if they have breached their credit limit (i.e., 
            if their credit balance is less than 0). The result should include user_id, user_name, credit (current balance), and credit_limit_breached (with values 'Yes' or 'No').

CREATE TABLE Users (
user_id INT PRIMARY KEY,
user_name VARCHAR(100),
credit INT );

CREATE TABLE Transactions ( 
trans_id INT PRIMARY KEY, 
paid_by INT,
paid_to INT,
amount INT,
transacted_on DATE );

INSERT INTO Users (user_id, user_name, credit) VALUES
(1, 'Moustafa', 100), 
(2, 'Jonathan', 200),
(3, 'Winston', 10000), 
(4, 'Luis', 800);

INSERT INTO Transactions 
(trans_id, 
paid_by, 
paid_to, 
amount,
transacted_on) VALUES
(1, 1, 3, 400, '2020-08-01'),
(2, 3, 2, 500, '2020-08-02'), 
(3, 2, 1, 200, '2020-08-03');







SELECT u.user_id,
, 0) dit,
u.user_name,
u.credit - COALESCE(SUM(CASE WHEN t.paid_by = u.user_id THEN t.amount ELSE 0 END) + COALESCE(SUM(CASE WHEN t.paid_to = u.user_id THEN t.amount ELSE 0 END), 0) AS cre
CASE
WHEN u.credit - COALESCE(SUM(CASE WHEN t.paid_by = u.user_id THEN t.amount EL
END), 0) + COALESCE(SUM(CASE WHEN t.paid_to = u.user_id THEN t.amount ELSE 0 END),
THEN 'Yes'
ELSE 'No'
END AS credit_limit_breached
SE 0 0) < 0
FROM Users u
LEFT JOIN Transactions t ON u.user_id = t.paid_by OR u.user_id = t.paid_to GROUP BY u.user_id
ORDER BY u.user_id;
