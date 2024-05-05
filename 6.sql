--6. For University database execute following queries:
--Department (dept_name, building, budget)
--Instructor (inst_id, name, salary, dept_name)
--Course (course_id, title, credits, dept_name)
--Teaches (course_id, inst_id)
-- Find the names of instructors who are working in IT dept.
-- Create a view to find out only instructors who have taught some course.
-- Give the increment of rs. 10000 to instructors whose salary is less than
--40000 else give increment of rs.20000.
-- Find average salary in each department.

SELECT name
FROM Instructor
WHERE dept_name = 'IT';

CREATE VIEW InstructorsWithCourses AS
SELECT DISTINCT Instructor.*
FROM Instructor
JOIN Teaches ON Instructor.inst_id = Teaches.inst_id;

UPDATE Instructor
SET salary = CASE
                WHEN salary < 40000 THEN salary + 10000
                ELSE salary + 20000
            END;


SELECT dept_name, AVG(salary) AS average_salary
FROM Instructor
GROUP BY dept_name;




