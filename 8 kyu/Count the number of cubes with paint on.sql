-- -----------------------------------------------------------
-- Upon arriving at an interview, you are presented with a solid blue cube. The cube is then dipped in red paint, coating the entire surface of the cube. 
-- The interviewer then proceeds to cut through the cube in all three dimensions a certain number of times.
-- 
-- Your function takes as parameter the number of times the cube has been cut. You must return the number of smaller cubes created by the cuts that 
-- have at least one red face.
-- 
-- To make it clearer, the picture below represents the cube after (from left to right) 0, 1 and 2 cuts have been made.
-- 
-- Examples:
-- countSquares(2) --> 26
-- countSquares(4) --> 98
-- -----------------------------------------------------------

--# write your SQL statement here: 
-- you are given a table 'squares' with column 'n' (numer of cubes).
-- return a table with: this column and your result in a column named 'res'

SELECT n, 
CASE
    WHEN n = 0 THEN 1
    ELSE CAST(POWER(n, 2) * 6 + 2 AS INT)
END
AS res FROM squares;

-- or

SELECT n, 
CASE
    WHEN n = 0 THEN 1
    ELSE n * n * 6 + 2
END
AS res FROM squares;

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