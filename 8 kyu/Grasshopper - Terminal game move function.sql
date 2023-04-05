-- -----------------------------------------------------------
-- Terminal game move function
-- In this game, the hero moves from left to right. The player rolls the dice and moves the number of spaces indicated by the dice two times.
-- 
-- In SQL, you will be given a table moves with columns position and roll. Return a table which uses the current position of the hero and the roll (1-
-- 6) and returns the new position in a column res.
-- 
-- Example:
-- move(3, 6) should equal 15
-- -----------------------------------------------------------

--# write your statement here: you will be given a table 'moves' 
-- with columns 'position' and 'roll'. return a table with a column 'res'. #--

SELECT position + roll * 2 AS res FROM moves;

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