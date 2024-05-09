--Write a function
--- which will show the level of the customer whether platinum, gold or silver.


DELIMITER //

CREATE FUNCTION get_customer_level(
    p_customer_id INT
)
RETURNS VARCHAR(10)
BEGIN
    DECLARE v_total_spent DECIMAL(10, 2);
    DECLARE v_purchase_count INT;

    -- Get total amount spent by the customer
    SELECT SUM(amount) INTO v_total_spent FROM orders WHERE customer_id = p_customer_id;

    -- Get the number of purchases made by the customer
    SELECT COUNT(*) INTO v_purchase_count FROM orders WHERE customer_id = p_customer_id;

    -- Determine the customer level
    IF v_total_spent >= 10000 OR v_purchase_count >= 10 THEN
        RETURN 'Platinum';
    ELSEIF v_total_spent >= 5000 OR v_purchase_count >= 5 THEN
        RETURN 'Gold';
    ELSE
        RETURN 'Silver';
    END IF;
END //

DELIMITER ;


