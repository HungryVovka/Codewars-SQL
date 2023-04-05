-- -----------------------------------------------------------
-- Very simple, given an integer or a floating-point number, find its opposite.
-- 
-- Examples:
-- 
-- 1: -1
-- 14: -14
-- -34: 34
-- 
-- You will be given a table: opposite, with a column: number. Return a table with a column: res.
-- -----------------------------------------------------------

-- You will be given a table: "opposite", with a column: "number". 
-- Return a table with a column: "res".

SELECT - number AS res FROM opposite;

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