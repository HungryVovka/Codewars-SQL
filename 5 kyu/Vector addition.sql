-- -----------------------------------------------------------
-- Task
-- You have to do some SQL magic, so that it is possible to do vector addition on int[] arrays (i.e. perform pairwise addition: 
-- a + b = {a[1] + b[1], a[2] + b[2], ..., a[n] + b[n]}) using the + operator. The resulting array should have the same length as the shortest 
-- of the inputs.
-- 
-- Example
--       a       |      b       |    a + b
-- --------------+--------------+--------------
--  {11, 13, 17} | {19, 23, 29} | {30, 36, 46}
--  {31, 37}     | {41, 43, 47} | {72, 80}
--  {53, 59, 61} | {67, 71}     | {120, 130}
--  {}           | {1, 2, 3}    | {}
--  {1, 2, 3}    | {}           | {}
-- -----------------------------------------------------------

CREATE FUNCTION vector_addition (a INTEGER[], b INTEGER[])
RETURNS INTEGER[]
LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN (
        SELECT ARRAY(
            SELECT i + j FROM UNNEST(a, b) AS ALIAS(i, j)
            WHERE i + j IS NOT NULL
        )
    );
END;
$$;

CREATE OPERATOR + (
    leftarg = INTEGER[],
    rightarg = INTEGER[],
    FUNCTION = vector_addition,
    commutator = OPERATOR(+)
);

-- -----------------------------------------------------------
-- License
-- Tasks are the property of Codewars (https://www.codewars.com/) 
-- and users of this resource.
-- 
-- All solution code in this repository 
-- is the personal property of Vladimir Rukavishnikov
-- (vladimirrukavishnikovmail@gmail.com).
-- 
-- Copyright (C) 2022 Vladimir Rukavishnikov
-- 
-- This file is part of the HungryVovka/Codewars-SQL
-- (https://github.com/HungryVovka/Codewars-SQL)
-- 
-- License is GNU General Public License v3.0
-- (https://github.com/HungryVovka/Codewars-SQL/blob/main/LICENSE)
-- 
-- You should have received a copy of the GNU General Public License v3.0
-- along with this code. If not, see http://www.gnu.org/licenses/
-- -----------------------------------------------------------