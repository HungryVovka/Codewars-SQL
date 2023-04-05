-- -----------------------------------------------------------
-- Given the table below:
-- 
-- ** names table schema **
-- 
-- id
-- prefix
-- first
-- last
-- suffix
-- 
-- Your task is to use a select statement to return a single column table containing the full title of the person (concatenate all columns together except 
-- id), as follows:
-- 
-- ** output table schema **
-- 
-- title
-- 
-- Don't forget to add spaces.
-- -----------------------------------------------------------

SELECT CONCAT(prefix, ' ',
              first, ' ',
              last, ' ',
              suffix)
AS title FROM names;

-- or

SELECT FORMAT('%s %s %s %s',
              prefix,
              first,
              last,
              suffix)
AS title FROM names;

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