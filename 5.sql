--5. For University database execute following queries:
--Department (dept_name, building, budget)
--Instructor (inst_id, name, salary, dept_name)
--Course (course_id, title, credits, dept_name)
--Teaches (course_id, inst_id)
-- Find the names of all instructors in music dept who have salary greater
--than 50000.
-- Find the details of instructors who are teaching some courses
-- List all instructors along with the courses that they teach.
-- List instructors in descending order.

SELECT name
FROM Instructor
WHERE dept_name = 'Music' AND salary > 50000;


SELECT *
FROM Instructor
WHERE inst_id IN (SELECT DISTINCT inst_id FROM Teaches);


SELECT Instructor.name, Course.title
FROM Instructor
JOIN Teaches ON Instructor.inst_id = Teaches.inst_id
JOIN Course ON Teaches.course_id = Course.course_id;


SELECT *
FROM Instructor
ORDER BY name DESC;



