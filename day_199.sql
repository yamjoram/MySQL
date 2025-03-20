CREATE TABLE MathEnrollment (
StudentID INT,
CourseName VARCHAR(100) );


CREATE TABLE ScienceEnrollment 
( StudentID INT,
CourseName VARCHAR(100) );


INSERT INTO MathEnrollment VALUES
(1, 'Math'),
(2, 'Math'),
(3, 'Math'),
(4, 'Math');

INSERT INTO ScienceEnrollment VALUES
(2, 'Science'),
(3, 'Science'),
(5, 'Science');

Question_1 :  Find students who are enrolled in either the Math or Science course (or both).

select * from MathEnrollment
union
select * from ScienceEnrollment;


Question_2 : Find students who are only enrolled in one course (i.e., students enrolled only in Math or only in Science, but not both).


select * from MathEnrollment 
where StudentID not in (select StudentID from ScienceEnrollment)
union
select * from ScienceEnrollment
where StudentID not in (select StudentID from MathEnrollment);
