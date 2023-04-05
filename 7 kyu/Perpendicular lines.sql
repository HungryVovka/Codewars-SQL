-- -----------------------------------------------------------
-- You are given an input (n) which represents the amount of lines you are given, your job is to figure out what is the maximum amount of perpendicular 
-- bisectors you can make using these lines.
-- 
-- Note: A perpendicular bisector is one that forms a 90 degree angle
-- 
-- n will always be greater than or equal to 0
-- -----------------------------------------------------------

--# write your SQL statement here: 
-- you are given a table 'perpendicular' with column 'n'
-- return a table with this column and your result in a column named 'res'.

SELECT n, FLOOR(n * n / 4)::INTEGER AS res FROM perpendicular;

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