-- -----------------------------------------------------------
-- Create a function with two arguments that will return an array of the first n multiples of x.
-- 
-- Assume both the given number and the number of times to count will be positive numbers greater than 0.
-- 
-- Return the results as an array or list ( depending on language ).
-- 
-- Examples
-- x = 1, n = 10 --> [1,2,3,4,5,6,7,8,9,10]
-- x = 2, n = 5  --> [2,4,6,8,10]
-- -----------------------------------------------------------

-- # write your SQL statement here: 
-- you are given a table 'counter' with columns 'x' (int) and 'n' (int)
-- return a query with columns 'x', 'n' and your result in a column named 'res' (array)
-- sort results by column 'x' ascending, then by 'n' ascending
-- note that each pair of 'x' and 'n' in 'counter' is unique 

SELECT x, n, (
    SELECT array_agg(x * i ORDER BY i)
    FROM generate_series(1, n) AS i
) AS res
FROM counter
ORDER BY x ASC, n ASC;

-- -----------------------------------------------------------
-- License
-- Tasks are the property of Codewars (https://www.codewars.com/) 
-- and users of this resource.
-- 
-- All solution code in this repository 
-- is the personal property of Vladimir Rukavishnikov
-- (vladimirrukavishnikovmail@gmail.com).
-- 
-- Copyright (C) 2025 Vladimir Rukavishnikov
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