--Execute cursor without handler and with handler.

--Without Exception Handler:
DECLARE
    CURSOR c_emp IS
        SELECT empno, ename FROM emp;
    v_empno emp.empno%TYPE;
    v_ename emp.ename%TYPE;
BEGIN
    OPEN c_emp;
    LOOP
        FETCH c_emp INTO v_empno, v_ename;
        EXIT WHEN c_emp%NOTFOUND;
        -- Process the fetched data here
        DBMS_OUTPUT.PUT_LINE('Employee: ' || v_empno || ', Name: ' || v_ename);
    END LOOP;
    CLOSE c_emp;
END;
/

--With Exception Handler:
DECLARE
    CURSOR c_emp IS
        SELECT empno, ename FROM emp;
    v_empno emp.empno%TYPE;
    v_ename emp.ename%TYPE;
BEGIN
    OPEN c_emp;
    LOOP
        FETCH c_emp INTO v_empno, v_ename;
        EXIT WHEN c_emp%NOTFOUND;
        -- Process the fetched data here
        DBMS_OUTPUT.PUT_LINE('Employee: ' || v_empno || ', Name: ' || v_ename);
    END LOOP;
    CLOSE c_emp;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

