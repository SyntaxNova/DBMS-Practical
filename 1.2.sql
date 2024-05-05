
--Problem Statement : 
--Write a procedure
--- to add new employee into emp table
--- which will return number of employees working in the department. Pass the
--dept no.

CREATE OR REPLACE PROCEDURE add_employee(
    p_empno     IN emp.empno%TYPE,
    p_ename     IN emp.ename%TYPE,
    p_job       IN emp.job%TYPE,
    p_mgr       IN emp.mgr%TYPE,
    p_hiredate  IN emp.hiredate%TYPE,
    p_sal       IN emp.sal%TYPE,
    p_comm      IN emp.comm%TYPE,
    p_deptno    IN emp.deptno%TYPE,
    p_num_emp   OUT NUMBER
)
IS
BEGIN
    -- Insert new employee into emp table
    INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (p_empno, p_ename, p_job, p_mgr, p_hiredate, p_sal, p_comm, p_deptno);

    -- Count number of employees in the specified department
    SELECT COUNT(*)
    INTO p_num_emp
    FROM emp
    WHERE deptno = p_deptno;
END add_employee;
/

