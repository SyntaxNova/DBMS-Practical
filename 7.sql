--7. For University database execute following queries:
--Department (dept_name, building, budget)
--Instructor (inst_id, name, salary, dept_name)
--Course (course_id, title, credits, dept_name)
--Teaches (course_id, inst_id)
-- Find average salary in each department
-- Find number of instructors with department name in each department
-- Find the names of all departments whose name includes substring “ i ”.
-- List the entire instructor relation in descending order.

SELECT dept_name, AVG(salary) AS average_salary
FROM Instructor
GROUP BY dept_name;


SELECT dept_name, COUNT(*) AS num_instructors
FROM Instructor
GROUP BY dept_name;


SELECT dept_name
FROM Department
WHERE dept_name LIKE '%i%';


SELECT *
FROM Instructor
ORDER BY inst_id DESC;





