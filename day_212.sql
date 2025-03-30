Question : Given a FamilyMembers table where each person has a ParentID (which references the PersonID of their parent),
            write a query to list all descendants of a specific person, say PersonID = 1, including indirect descendants.




CREATE TABLE FamilyMembers (
PersonID INT PRIMARY KEY, 
PersonName VARCHAR(100), 
ParentID INT
);

INSERT INTO FamilyMembers VALUES 
(1, 'John Doe', NULL),
(2, 'Alice Smith', 1),
(3, 'Bob Brown', 1),
(4, 'Charlie Davis', 2),
(5, 'Eve Harris', 2),
(6, 'Frank Black', 3),
(7, 'Grace White', 3);


with recursive fam_tree as (
select PersonID, PersonName, ParentID
from FamilyMembers
where PersonID = 1
union all 
select fm.PersonID, fm.PersonName, fm.ParentID
from FamilyMembers fm
inner join fam_tree ft
  on fm.ParentID = ft.PersonID
)
select * from fam_tree;
