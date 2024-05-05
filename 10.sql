--10. Consider a relational database
--Supplier (Sid, Sname, address)
--Parts(Pid, Pname, color)
--Catalog(Sid, Pid, cost)
--Write SQL queries for the following:
--i) Find the names of suppliers who supply some red parts.
--ii) Find the names of all parts whose cost is more than Rs.250.
--iii) Find name of all parts whose color is green.
--iv) Find number of parts supplied by each supplier

SELECT DISTINCT Sname
FROM Supplier
JOIN Catalog ON Supplier.Sid = Catalog.Sid
JOIN Parts ON Catalog.Pid = Parts.Pid
WHERE Parts.color = 'red';

SELECT DISTINCT Pname
FROM Parts
JOIN Catalog ON Parts.Pid = Catalog.Pid
WHERE Catalog.cost > 250;

SELECT Pname
FROM Parts
WHERE color = 'green';

SELECT Supplier.Sname, COUNT(Catalog.Pid) AS NumPartsSupplied
FROM Supplier
LEFT JOIN Catalog ON Supplier.Sid = Catalog.Sid
GROUP BY Supplier.Sname;



