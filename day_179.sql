CREATE TABLE UserLogins (
UserID INT,
LoginDate DATE );

INSERT INTO UserLogins(UserID, LoginDate) VALUES
(1, '2024-01-01'),
(1, '2024-01-02'), 
(1, '2024-01-04'),
(1, '2024-01-05'),
(1, '2024-01-06'),
(2, '2024-01-01'), 
(2, '2024-01-02'), 
(2, '2024-01-04'),
(2, '2024-01-05'),
(3, '2024-01-03'), 
(3, '2024-01-04'), 
(3, '2024-01-05'),
(3, '2024-01-06'), 
(4, '2024-01-01'),
(4, '2024-01-03'),
(4, '2024-01-04');


WITH RankedLogins AS (
    SELECT
        UserID,
        LoginDate,
        ROW_NUMBER() OVER (PARTITION BY UserID ORDER BY LoginDate) AS rn
    FROM
        UserLogins
),
StreakGroups AS (
    SELECT
        UserID,
        LoginDate,
        DATE_SUB(LoginDate, INTERVAL rn DAY) AS streak_start
    FROM
        RankedLogins
),
StreakLengths AS (
    SELECT
        UserID,
        streak_start,
        COUNT(*) AS streak_length
    FROM
        StreakGroups
    GROUP BY
        UserID, streak_start
)
SELECT
    UserID,
    MAX(streak_length) AS longest_streak
FROM
    StreakLengths
GROUP BY
    UserID;
