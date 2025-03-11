CREATE TABLE LeaveRequests (
RequestID INT PRIMARY KEY, 
EmployeeID INT,
LeaveStartDate DATE, 
LeaveDuration INT
);

INSERT INTO LeaveRequests (
RequestID, 
EmployeeID, 
LeaveStartDate,
LeaveDuration) VALUES
(1, 101, '2024-02-01', 5),
(2, 102, '2024-03-05', 3), 
(3, 103, '2024-04-10', 7);

Questions : You need to calculate the end date of a leave request by adding the LeaveDuration (in days) to the LeaveStartDate.


select EmployeeID,
date_add(LeaveStartDate, interval LeaveDuration day) as leave_end_date
from LeaveRequests;
