--Write a function
--- that accepts employee number and return the salary status as low, high,
--based on his salary.

CREATE OR REPLACE FUNCTION get_salary_status(
    p_empno     IN emp.empno%TYPE
)
RETURN VARCHAR2
IS
    v_salary    emp.sal%TYPE;
    v_status    VARCHAR2(10);
BEGIN
    -- Retrieve the salary of the employee
    SELECT sal INTO v_salary FROM emp WHERE empno = p_empno;

    -- Check salary status
    IF v_salary < 5000 THEN
        v_status := 'Low';
    ELSE
        v_status := 'High';
    END IF;

    -- Return the salary status
    RETURN v_status;
END get_salary_status;
/

