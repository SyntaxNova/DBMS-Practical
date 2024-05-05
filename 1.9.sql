--Write a trigger for before insert/ after delete.

--BEFORE INSERT Trigger:
CREATE OR REPLACE TRIGGER before_insert_trigger
BEFORE INSERT ON your_table
FOR EACH ROW
BEGIN
    -- Add logic here to manipulate data before insertion
    IF :NEW.column_name = 'specific_value' THEN
        -- Manipulate data if needed
        :NEW.column_name := 'modified_value';
    END IF;
END;
/

--AFTER DELETE Trigger:
CREATE OR REPLACE TRIGGER after_delete_trigger
AFTER DELETE ON your_table
FOR EACH ROW
BEGIN
    -- Add logic here to perform actions after deletion
    INSERT INTO audit_table (deleted_id, deleted_name, deleted_date)
    VALUES (:OLD.id, :OLD.name, SYSDATE);
END;
/

