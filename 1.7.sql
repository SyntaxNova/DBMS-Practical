--Execute cursor without handler and with handler.

--Without Exception Handler:
CREATE PROCEDURE cursor_without_handler()
BEGIN
    DECLARE emp_id INT;
    DECLARE emp_first_name VARCHAR(50);
    DECLARE emp_last_name VARCHAR(50);

    DECLARE cur CURSOR FOR SELECT employee_id, first_name, last_name FROM employees;
    OPEN cur;
    
    cursor_loop: LOOP
        FETCH cur INTO emp_id, emp_first_name, emp_last_name;
        IF emp_id IS NULL THEN
            LEAVE cursor_loop;
        END IF;
        
        -- Process data here
    END LOOP;

    CLOSE cur;
END;


--With Exception Handler:
CREATE PROCEDURE cursor_with_handler()
BEGIN
    DECLARE emp_id INT;
    DECLARE emp_first_name VARCHAR(50);
    DECLARE emp_last_name VARCHAR(50);
    DECLARE done BOOLEAN DEFAULT FALSE;

    DECLARE cur CURSOR FOR SELECT employee_id, first_name, last_name FROM employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;

    cursor_loop: LOOP
        FETCH cur INTO emp_id, emp_first_name, emp_last_name;
        IF done THEN
            LEAVE cursor_loop;
        END IF;
        
        -- Process data here
    END LOOP;

    CLOSE cur;
END;

