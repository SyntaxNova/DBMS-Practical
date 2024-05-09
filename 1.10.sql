--Execute row level trigger.

CREATE TABLE employees (
    employee_id NUMBER,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    salary NUMBER
);
DELIMITER //

CREATE TRIGGER after_employee_delete
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    -- Example: Log the deletion in a separate table
    INSERT INTO employee_deletion_log (employee_id, deletion_date)
    VALUES (OLD.employee_id, NOW());
END //

DELIMITER ;


