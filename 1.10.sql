--Execute row level trigger.

CREATE TABLE employees (
    employee_id NUMBER,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    salary NUMBER
);
CREATE OR REPLACE TRIGGER log_salary_update
AFTER UPDATE OF salary ON employees
FOR EACH ROW
DECLARE
    v_old_salary NUMBER;
    v_new_salary NUMBER;
BEGIN
    v_old_salary := :OLD.salary;
    v_new_salary := :NEW.salary;
    
    DBMS_OUTPUT.PUT_LINE('Old Salary: ' || v_old_salary);
    DBMS_OUTPUT.PUT_LINE('New Salary: ' || v_new_salary);
END;
/
UPDATE employees
SET salary = 60000
WHERE employee_id = 101;

