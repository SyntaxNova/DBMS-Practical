--Problem Statement : 
--Write a PL/SQL block to calculate the grade of minimum 10 students.

DECLARE
    v_student_id    NUMBER;
    v_student_name  VARCHAR2(100);
    v_marks         NUMBER;
    v_grade         VARCHAR2(10);
BEGIN
    FOR i IN 1..10 LOOP
        -- Assuming you have a table called 'students' with columns 'student_id', 'student_name', and 'marks'
        -- and you have stored the data in that table
        -- You can replace 'students' with your actual table name

        SELECT student_id, student_name, marks
        INTO v_student_id, v_student_name, v_marks
        FROM students
        WHERE ROWNUM <= 10; -- Selecting the first 10 students, you can adjust the condition as per your requirement

        -- Calculate grade based on marks
        IF v_marks >= 90 THEN
            v_grade := 'A+';
        ELSIF v_marks >= 80 THEN
            v_grade := 'A';
        ELSIF v_marks >= 70 THEN
            v_grade := 'B';
        ELSIF v_marks >= 60 THEN
            v_grade := 'C';
        ELSIF v_marks >= 50 THEN
            v_grade := 'D';
        ELSE
            v_grade := 'F';
        END IF;

        -- Print student information and grade
        DBMS_OUTPUT.PUT_LINE('Student ID: ' || v_student_id || ', Student Name: ' || v_student_name || ', Marks: ' || v_marks || ', Grade: ' || v_grade);
    END LOOP;
END;
/

