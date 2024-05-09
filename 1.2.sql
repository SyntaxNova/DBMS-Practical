
--Problem Statement : 
--Write a procedure
--- to add new employee into emp table
--- which will return number of employees working in the department. Pass the
--dept no.

DELIMITER //

CREATE PROCEDURE add_employee_and_get_department_count(
    IN p_empno INT,
    IN p_ename VARCHAR(50),
    IN p_job VARCHAR(50),
    IN p_mgr INT,
    IN p_hiredate DATE,
    IN p_sal DECIMAL(10, 2),
    IN p_comm DECIMAL(10, 2),
    IN p_deptno INT,
    OUT p_department_count INT
)
BEGIN
    -- Insert new employee into emp table
    INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (p_empno, p_ename, p_job, p_mgr, p_hiredate, p_sal, p_comm, p_deptno);

    -- Get count of employees in the department
    SELECT COUNT(*) INTO p_department_count FROM emp WHERE deptno = p_deptno;
END //

DELIMITER ;

-- to call procedure
SET @department_count := 0;

CALL add_employee_and_get_department_count(
    8001,
    'John Doe',
    'Manager',
    7839,
    '2024-05-08',
    5000.00,
    NULL,
    20,
    @department_count
);

SELECT @department_count AS department_count;


