
Questions : Given a Tasks table where each task has a TaskID, TaskName, and a PredecessorID (which references the TaskID of the task that must be completed before the current task), 
            write a query using Recursive CTEs to find the longest dependency chain (path) of tasks. The result should include the TaskID and TaskName in the longest path.


CREATE TABLE Tasks (
TaskID INT PRIMARY KEY,
TaskName VARCHAR(100),
PredecessorID INT );

INSERT INTO Tasks VALUES 
(1, 'Task A', NULL),
(2, 'Task B', 1),
(3, 'Task C', 2),
(4, 'Task D', 2),
(5, 'Task E', 3),
(6, 'Task F', 5),
(7, 'Task G', 6),
(8, 'Task H', 4),
(9, 'Task I', 7);

with recursive task_depend as (
select TaskID, TaskName, PredecessorID, 1 as path_length, cast(TaskName as char) as path 
from Tasks
where PredecessorID is NULL

union all 

select t.TaskID, t.TaskName, t.PredecessorID, td.path_length + 1, concat(td.path, "-", t.TaskName)
from Tasks t 
inner join task_depend td 
on td.TaskID = t.PredecessorID)
select TaskID, TaskName, PredecessorID, path from task_depend
where path_length = (select max(path_length) from task_depend)
;
