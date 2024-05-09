--Problem Statement : 
--Write a PL/SQL block to calculate the grade of minimum 10 students.

CREATE TABLE student_marks (
    student_id INT,
    name VARCHAR(50),
    subject VARCHAR(50),
    marks INT
);

INSERT INTO student_marks (student_id, name, subject, marks) VALUES (1, 'John', 'Math', 85);
INSERT INTO student_marks (student_id, name, subject, marks) VALUES (2, 'Alice', 'Math', 75);
INSERT INTO student_marks (student_id, name, subject, marks) VALUES (3, 'Bob', 'Math', 90);


DELIMITER //

CREATE PROCEDURE calculate_grades()
BEGIN
    DECLARE student_id INT;
    DECLARE name_var VARCHAR(50);
    DECLARE subject_var VARCHAR(50);
    DECLARE marks_var INT;
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE v_student_count INT;
    DECLARE v_total_marks INT;
    DECLARE v_average_marks DECIMAL(5, 2);
    DECLARE v_grade CHAR(1);
    
    SELECT COUNT(*) INTO v_student_count FROM student_marks;
    
    SELECT SUM(marks) INTO v_total_marks FROM student_marks;
    
    SET v_average_marks := v_total_marks / v_student_count;
    
    DECLARE cur CURSOR FOR SELECT student_id, name, subject, marks FROM student_marks;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    grade_loop: LOOP
        FETCH cur INTO student_id, name_var, subject_var, marks_var;
        IF done THEN
            LEAVE grade_loop;
        END IF;
        
        IF marks_var >= v_average_marks THEN
            SET v_grade := 'A';
        ELSEIF marks_var >= v_average_marks * 0.7 THEN
            SET v_grade := 'B';
        ELSEIF marks_var >= v_average_marks * 0.5 THEN
            SET v_grade := 'C';
        ELSE
            SET v_grade := 'D';
        END IF;
        
        SELECT CONCAT('Grade for ', name_var, ' is ', v_grade) AS result;
    END LOOP;
    
    CLOSE cur;
END //

DELIMITER ;

