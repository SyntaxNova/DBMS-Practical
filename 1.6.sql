--Write a function which
--- will accept input as a number and print whether it is even or odd
--- will find the largest number among three numbers.

--Function to Determine Even or Odd:
DELIMITER //

CREATE FUNCTION check_even_or_odd(
    p_number INT
)
RETURNS VARCHAR(10)
BEGIN
    IF p_number % 2 = 0 THEN
        RETURN 'Even';
    ELSE
        RETURN 'Odd';
    END IF;
END //

DELIMITER ;

--Function to Find the Largest Number Among Three:
DELIMITER //

CREATE FUNCTION find_largest_number(
    p_num1 INT,
    p_num2 INT,
    p_num3 INT
)
RETURNS INT
BEGIN
    DECLARE v_largest INT;
    
    IF p_num1 >= p_num2 AND p_num1 >= p_num3 THEN
        SET v_largest = p_num1;
    ELSE IF p_num2 >= p_num1 AND p_num2 >= p_num3 THEN
        SET v_largest = p_num2;
    ELSE
        SET v_largest = p_num3;
    END IF;
    
    RETURN v_largest;
END //

DELIMITER ;

-- use of funstion 
-- Check if a number is even or odd
SELECT check_even_or_odd(5) AS result; -- Output: Odd

-- Find the largest number among three numbers
SELECT find_largest_number(10, 20, 15) AS largest_number; -- Output: 20
 
