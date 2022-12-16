-- -----------------------------------------------------------
-- Given the following table 'decimals':
-- 
-- decimals table schema
-- id
-- number1
-- number2
-- 
-- Return a table with a single column towardzero where the values are the result of number1 + number2 truncated towards zero.
-- -----------------------------------------------------------

SELECT
CASE
    WHEN number1 + number2 > 0 THEN FLOOR(number1 + number2)
    ELSE CEILING(number1 + number2)
END
AS towardzero FROM decimals;

-- or

SELECT TRUNC(number1 + number2) AS towardzero FROM decimals;