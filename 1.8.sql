--Write a procedure
--- To perform arithmetic operations.

DELIMITER //

CREATE PROCEDURE perform_arithmetic_operations(
    IN p_operand1 DECIMAL(10, 2),
    IN p_operand2 DECIMAL(10, 2),
    IN p_operator VARCHAR(1),
    OUT p_result DECIMAL(10, 2)
)
BEGIN
    CASE p_operator
        WHEN '+' THEN
            SET p_result = p_operand1 + p_operand2;
        WHEN '-' THEN
            SET p_result = p_operand1 - p_operand2;
        WHEN '*' THEN
            SET p_result = p_operand1 * p_operand2;
        WHEN '/' THEN
            IF p_operand2 <> 0 THEN
                SET p_result = p_operand1 / p_operand2;
            ELSE
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Division by zero';
            END IF;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Invalid operator';
    END CASE;
END //

DELIMITER ;


-- call
CALL perform_arithmetic_operations(10, 5, '+', @result);
SELECT @result; -- Output: 15

CALL perform_arithmetic_operations(10, 5, '/', @result);
SELECT @result; -- Output: 2

CALL perform_arithmetic_operations(10, 0, '/', @result); -- This will raise an error: Division by zero

