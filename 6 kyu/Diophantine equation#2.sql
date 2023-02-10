-- -----------------------------------------------------------
-- In mathematics, a Diophantine equation is a polynomial equation, usually in two or more unknowns, such that only the integer solutions are sought 
-- or studied.
-- 
-- the task is to find the number of pairs of x and y are
-- 
-- x^2 + y^3 = n  which n <= 1e+18 x >= 0 y >= 0
-- 
-- Examples:
-- 
-- DEquations.Solve(9) => return 2;
-- 
-- DEquations.Solve(10000000000000000000) => return 1;
-- -----------------------------------------------------------

--# write your SQL statement here: 
-- you are given a table 'dequations' with column 'n'
-- return a table with:
--   this column and your result in a column named 'res'
--   ordered ascending by 'n'
--   distinct results (remove duplicates)

SELECT n, COUNT(y) AS res FROM dequations
LEFT JOIN LATERAL(
    SELECT SQRT(N-POW(
        GENERATE_SERIES(
            0, FLOOR(CBRT(n))::INTEGER), 3))::DECIMAL % 1 = 0 
    AS y)
AS x ON y
GROUP BY n ORDER BY n;