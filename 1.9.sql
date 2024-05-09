--Write a trigger for before insert/ after delete.

--BEFORE INSERT Trigger:
CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    -- Example: Prevent insertion if the salary is negative
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Salary cannot be negative';
    END IF;
END;


--AFTER DELETE Trigger:
CREATE TRIGGER after_employee_delete
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    -- Example: Log the deletion in a separate table
    INSERT INTO employee_deletion_log (employee_id, deletion_date)
    VALUES (OLD.employee_id, NOW());
END;

