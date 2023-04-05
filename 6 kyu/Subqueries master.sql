-- -----------------------------------------------------------
-- The objective of this Kata is to show that you are proficient at string manipulation (and perhaps that you can use extensively subqueries).
-- 
-- You will use people table but will focus solely on the name column
-- 
-- 									name
-- 							Greyson Tate Lebsack Jr.
-- 							Elmore Clementina O'Conner
-- 
-- you will be provided with a full name and you have to return the name in columns as follows.
-- 
-- name						first_lastname						second_lastname
-- Greyson 						Tate								Lebsack	Jr.
-- Elmore						Clementina							O'Conner
-- 
-- Note: Don't forget to remove spaces around names in your result.
-- Note: Due to multicultural context, if full name has more than 3 words, consider the last 2 as first_lastname and second_lastname, all other 
-- names belonging to name.
-- -----------------------------------------------------------

SELECT TRIM(CONCAT(REVERSE(SPLIT_PART(REVERSE(name), ' ', 4)), ' ',
                   REVERSE(SPLIT_PART(REVERSE(name), ' ', 3)))) AS name,
REVERSE(SPLIT_PART(REVERSE(name), ' ', 2)) AS first_lastname,
REVERSE(SPLIT_PART(REVERSE(name), ' ', 1)) AS second_lastname
FROM people;

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