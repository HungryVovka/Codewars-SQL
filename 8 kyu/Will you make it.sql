-- -----------------------------------------------------------
-- You were camping with your friends far away from home, but when it's time to go back, you realize that your fuel is running out and the nearest 
-- pump is 50 miles away! You know that on average, your car runs on about 25 miles per gallon. There are 2 gallons left.
-- 
-- Considering these factors, write a function that tells you if it is possible to get to the pump or not.
-- 
-- Function should return true if it is possible and false if not.
-- -----------------------------------------------------------

--# write your SQL statement here: you are given a table 'zerofuel' 
-- with columns 'distance_to_pump', 'mpg' and 'fuel_left', return 
-- a table with all the columns and your result in a column named 'res'.

SELECT distance_to_pump, mpg, fuel_left, distance_to_pump <= fuel_left * mpg AS res FROM zerofuel;

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