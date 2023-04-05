-- -----------------------------------------------------------
-- Write a select statement that takes name from person table and return "Hello, <name> how are you doing today?" results in a column named 
-- greeting
-- 
-- [Make sure you type the exact thing I wrote or the program may not execute properly]
-- -----------------------------------------------------------

--person table has name data

SELECT CONCAT('Hello, ', name, ' how are you doing today?') AS greeting FROM person;

-- or

SELECT FORMAT('Hello, %s how are you doing today?', name) AS greeting FROM person;

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