--3. For University database execute following queries:
--Department (dept_name, building, budget)
--Instructor (inst_id, name, salary, dept_name)
--Course (course_id, title, credits, dept_name)
--Teaches (course_id, inst_id)
-- Create a view to find instructor name and course for instructors in IT
--department.
-- Find the names of all instructors whose salary is greater than at least one
--instructor in biology dept.
-- Find titles along with department where department must end with “ y ”.
-- Find the titles along with department name of biology department.


CREATE VIEW IT_InstructorCourses AS
SELECT Instructor.name, Course.title
FROM Instructor
JOIN Teaches ON Instructor.inst_id = Teaches.inst_id
JOIN Course ON Teaches.course_id = Course.course_id
WHERE Instructor.dept_name = 'IT';


SELECT DISTINCT I1.name
FROM Instructor I1
WHERE I1.salary > ANY (SELECT I2.salary FROM Instructor I2 WHERE I2.dept_name = 'Biology');


SELECT Course.title, Department.dept_name
FROM Course
JOIN Department ON Course.dept_name = Department.dept_name
WHERE Department.dept_name LIKE '%y';


SELECT title, dept_name
FROM Course
WHERE dept_name = 'Biology';

