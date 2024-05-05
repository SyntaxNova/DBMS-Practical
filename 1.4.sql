--Write a function
--- which will show the level of the customer whether platinum, gold or silver.

--Assumptions : 
--Platinum: Total purchase amount greater than or equal to 10000
--Gold: Total purchase amount greater than or equal to 5000 and less than 10000
--Silver: Total purchase amount less than 5000

CREATE OR REPLACE FUNCTION get_customer_level(
    p_customer_id   IN customers.customer_id%TYPE
)
RETURN VARCHAR2
IS
    v_total_purchase_amount  NUMBER;
    v_customer_level        VARCHAR2(10);
BEGIN
    -- Calculate total purchase amount for the customer
    SELECT SUM(purchase_amount)
    INTO v_total_purchase_amount
    FROM purchases
    WHERE customer_id = p_customer_id;

    -- Determine customer level based on total purchase amount
    IF v_total_purchase_amount >= 10000 THEN
        v_customer_level := 'Platinum';
    ELSIF v_total_purchase_amount >= 5000 THEN
        v_customer_level := 'Gold';
    ELSE
        v_customer_level := 'Silver';
    END IF;

    -- Return the customer level
    RETURN v_customer_level;
END get_customer_level;
/

