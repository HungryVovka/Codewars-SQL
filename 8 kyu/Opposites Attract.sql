-- -----------------------------------------------------------
-- Timmy & Sarah think they are in love, but around where they live, they will only know once they pick a flower each. If one of the flowers has an even 
-- number of petals and the other has an odd number of petals it means they are in love.
-- 
-- Write a function that will take the number of petals of each flower and return true if they are in love and false if they aren't.
-- -----------------------------------------------------------

-- # write your SQL statement here: you are given a table 'love' 
-- with columns 'flower1' and 'flower2', 
-- return a table with all the columns and your 
-- result in a column named 'res'.

SELECT flower1, flower2,
CASE
    WHEN (flower1 % 2 = 0 AND flower2 % 2 != 0) OR (flower2 % 2 = 0 and flower1 % 2 != 0)
    THEN TRUE
    ELSE FALSE
END
AS res FROM love;

-- or

SELECT flower1, flower2,
CASE
    WHEN (flower1 + flower2) % 2 != 0
    THEN TRUE
    ELSE FALSE
END
AS res FROM love;

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