--4. For University database execute following queries:
--Department (dept_name, building, budget)
--Instructor (inst_id, name, salary, dept_name)
--Course (course_id, title, credits, dept_name)
--Teaches (course_id, inst_id)
-- Find the average salary of the instructors who are in music dept.
-- Find the average salary in each dept.
-- Find out department name with average salary in each department where
--average salary is greater than 40000.

SELECT AVG(salary) AS average_salary
FROM Instructor
WHERE dept_name = 'Music';


SELECT dept_name, AVG(salary) AS average_salary
FROM Instructor
GROUP BY dept_name;

SELECT dept_name, AVG(salary) AS average_salary
FROM Instructor
GROUP BY dept_name
HAVING AVG(salary) > 40000;


