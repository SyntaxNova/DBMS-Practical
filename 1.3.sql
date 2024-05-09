--Write a function
--- that accepts employee number and return the salary status as low, high,
--based on his salary.

DELIMITER //

CREATE FUNCTION get_salary_status(
    p_empno INT
)
RETURNS VARCHAR(10)
BEGIN
    DECLARE v_salary DECIMAL(10, 2);

    -- Get the salary of the employee
    SELECT sal INTO v_salary FROM emp WHERE empno = p_empno;

    -- Determine the salary status
    IF v_salary < 5000 THEN
        RETURN 'Low';
    ELSE
        RETURN 'High';
    END IF;
END //

DELIMITER ;


--To call this function 

SELECT get_salary_status(8001) AS salary_status;

