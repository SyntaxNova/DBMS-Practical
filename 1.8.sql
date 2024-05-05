--Write a procedure
--- To perform arithmetic operations.

CREATE OR REPLACE PROCEDURE perform_arithmetic_operations(
    p_num1 IN NUMBER,
    p_num2 IN NUMBER
)
IS
    v_sum NUMBER;
    v_difference NUMBER;
    v_product NUMBER;
    v_quotient NUMBER;
BEGIN
    -- Perform arithmetic operations
    v_sum := p_num1 + p_num2;
    v_difference := p_num1 - p_num2;
    v_product := p_num1 * p_num2;
    
    -- Check if the second number is not zero to avoid division by zero error
    IF p_num2 <> 0 THEN
        v_quotient := p_num1 / p_num2;
    ELSE
        v_quotient := NULL;
    END IF;
    
    -- Display the results
    DBMS_OUTPUT.PUT_LINE('Sum: ' || v_sum);
    DBMS_OUTPUT.PUT_LINE('Difference: ' || v_difference);
    DBMS_OUTPUT.PUT_LINE('Product: ' || v_product);
    
    IF v_quotient IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Quotient: ' || v_quotient);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Cannot divide by zero');
    END IF;
END perform_arithmetic_operations;
/

