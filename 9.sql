--9. Consider following database:
--Student (RollNo, Name, Address)
--Subject (SubCode, SubName)
--Marks (RollNo, SubCode,Marks)
--Write following queries in SQL:
--i) Find average marks of each student, along with the name of student.
--ii) Find how many students have failed in the subject “DBMS”.
--iii) Find the number of students who are passed in “ OS”.
--iv) Find the maximum marks of the subject “TOC”.

SELECT Student.Name, AVG(Marks.Marks) AS AverageMarks
FROM Student
JOIN Marks ON Student.RollNo = Marks.RollNo
GROUP BY Student.RollNo, Student.Name;


SELECT COUNT(*) AS FailedStudentsCount
FROM Marks
WHERE SubCode = 'DBMS' AND Marks < 40;


SELECT COUNT(*) AS PassedStudentsCount
FROM Marks
WHERE SubCode = 'OS' AND Marks >= 40;


SELECT MAX(Marks) AS MaxMarksTOC
FROM Marks
WHERE SubCode = 'TOC';

