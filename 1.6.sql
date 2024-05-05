--Write a function which
--- will accept input as a number and print whether it is even or odd
--- will find the largest number among three numbers.

--Function to Determine Even or Odd:
CREATE OR REPLACE FUNCTION check_even_odd(
    p_number IN NUMBER
)
RETURN VARCHAR2
IS
BEGIN
    IF MOD(p_number, 2) = 0 THEN
        RETURN 'Even';
    ELSE
        RETURN 'Odd';
    END IF;
END check_even_odd;
/

--Function to Find the Largest Number Among Three:
CREATE OR REPLACE FUNCTION find_largest(
    p_num1 IN NUMBER,
    p_num2 IN NUMBER,
    p_num3 IN NUMBER
)
RETURN NUMBER
IS
    v_max NUMBER;
BEGIN
    v_max := GREATEST(p_num1, p_num2, p_num3);
    RETURN v_max;
END find_largest;
/



DECLARE
    v_result VARCHAR2(10);
    v_largest NUMBER;
BEGIN
    -- Test check_even_odd function
    v_result := check_even_odd(7);
    DBMS_OUTPUT.PUT_LINE('7 is ' || v_result);

    -- Test find_largest function
    v_largest := find_largest(10, 20, 15);
    DBMS_OUTPUT.PUT_LINE('Largest number is: ' || v_largest);
END;
/

