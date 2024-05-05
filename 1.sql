--1. For University database execute following queries:
--Department (dept_name, building, budget)
--Instructor (inst_id, name, salary, dept_name)
--Course (course_id, title, credits, dept_name)
--Teaches (course_id, inst_id)
-- Create a view to find out only instructors who have taught some course.
-- Find the names of all departments whose name includes substring “ i ”
-- Find titles along with department where department must end with “ y ”.
-- Execute join operations.

CREATE VIEW InstructorsWithCourses AS
SELECT DISTINCT Instructor.inst_id, Instructor.name
FROM Instructor
JOIN Teaches ON Instructor.inst_id = Teaches.inst_id;


SELECT dept_name
FROM Department
WHERE dept_name LIKE '%i%';

SELECT Course.title, Department.dept_name
FROM Course
JOIN Department ON Course.dept_name = Department.dept_name
WHERE Department.dept_name LIKE '%y';

SELECT *
FROM Instructor
INNER JOIN Teaches ON Instructor.inst_id = Teaches.inst_id;

SELECT *
FROM Instructor
LEFT JOIN Teaches ON Instructor.inst_id = Teaches.inst_id;

SELECT *
FROM Instructor
RIGHT JOIN Teaches ON Instructor.inst_id = Teaches.inst_id;








