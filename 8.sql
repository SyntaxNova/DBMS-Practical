--8. Department (dept_name, building, budget)
--Student( sid, sname, tot_credits,dept_name,grade)
--Course (course_id, title, credits, dept_name)
--Takes(sid,course_id)
-- Find the name of students who have taken some courses
-- Find the details of the students who are in Computer department
-- Find the names of all departments whose name includes substring “ a ”.

SELECT DISTINCT sname
FROM Student
INNER JOIN Takes ON Student.sid = Takes.sid;

SELECT *
FROM Student
WHERE dept_name = 'Computer';

SELECT dept_name
FROM Department
WHERE dept_name LIKE '%a%';


