

Questions : Write a SQL query to report the league statistics, including matches played, points, goals scored, goals conceded, and goal difference for each team.
            Explanation
            To calculate the statistics:
            • matches_played: Count the number of times the team appears as a home or away team. • points: 3 points for a win, 0 points for a loss, and 1 point for a draw.
            • goal_for: The total goals scored by the team in all matches.
            • goal_against: The total goals conceded by the team in all matches.
            • goal_diff: Calculated as goal_for - goal_against. The results need to be sorted by:
            • points in descending order.
            • If points are tied, by goal_diff in descending order.
            • If both points and goal_diff are tied, by team_name lexicographically.


CREATE TABLE Teams (
team_id INT PRIMARY KEY,
team_name VARCHAR(100) );

CREATE TABLE Matches (
home_team_id INT,
away_team_id INT,
home_team_goals INT,
away_team_goals INT,
PRIMARY KEY(home_team_id, away_team_id)
);

INSERT INTO Teams (team_id, team_name) VALUES
    (1, 'Team A'),
    (2, 'Team B'),
    (3, 'Team C');
    
INSERT INTO Matches (home_team_id, away_team_id, home_team_goals, away_team_goals) VALUES
    (1, 2, 2, 1),
    (1, 3, 1, 1),
    (2, 3, 3, 2),
    (2, 1, 0, 1),
    (3, 1, 1, 2);

SELECT t.team_name,
COUNT(m.home_team_id) + COUNT(m.away_team_id) AS matches_played, SUM(CASE
s)
oals) THEN 3
WHEN (m.home_team_id = t.team_id AND m.home_team_goals > m.away_team_goal OR (m.away_team_id = t.team_id AND m.away_team_goals > m.home_team_g
WHEN m.home_team_goals = m.away_team_goals THEN 1
               ELSE 0
           END) AS points,
SUM(CASE
WHEN m.home_team_id = t.team_id THEN m.home_team_goals WHEN m.away_team_id = t.team_id THEN m.away_team_goals
END) AS goal_for, SUM(CASE
WHEN m.home_team_id = t.team_id THEN m.away_team_goals
WHEN m.away_team_id = t.team_id THEN m.home_team_goals END) AS goal_against,
SUM(CASE
WHEN m.home_team_id = t.team_id THEN m.home_team_goals WHEN m.away_team_id = t.team_id THEN m.away_team_goals
           END) - SUM(CASE
WHEN m.home_team_id = t.team_id THEN m.away_team_goals
WHEN m.away_team_id = t.team_id THEN m.home_team_goals END) AS goal_diff
FROM Teams t
LEFT JOIN Matches m ON t.team_id = m.home_team_id OR t.team_id = m.away_team_id GROUP BY t.team_name
ORDER BY points DESC, goal_diff DESC, t.team_name;
