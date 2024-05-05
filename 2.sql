--2. For University database execute following queries:
--Department (dept_name, building, budget)
--Instructor (inst_id, name, salary, dept_name)
--Course (course_id, title, credits, dept_name)
--Teaches (course_id, inst_id)
-- Find the names of all instructors in Computer dept who have salary
--greater than 70000.
-- Create a view using more than two tables.
-- Find the names of instructors whose names are exactly five characters.
-- Execute join operations.


SELECT name
FROM Instructor
WHERE dept_name = 'Computer' AND salary > 70000;


CREATE VIEW InstructorCourses AS
SELECT Instructor.inst_id, Instructor.name, Course.title
FROM Instructor
JOIN Teaches ON Instructor.inst_id = Teaches.inst_id
JOIN Course ON Teaches.course_id = Course.course_id;

SELECT name
FROM Instructor
WHERE LENGTH(name) = 5;


SELECT *
FROM Instructor
INNER JOIN Teaches ON Instructor.inst_id = Teaches.inst_id;

SELECT *
FROM Instructor
LEFT JOIN Teaches ON Instructor.inst_id = Teaches.inst_id;

SELECT *
FROM Instructor
RIGHT JOIN Teaches ON Instructor.inst_id = Teaches.inst_id;




