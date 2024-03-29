-- -----------------------------------------------------------
-- You are given a table with the following format:
-- 
-- ** encryption table schema **
-- 
-- md5
-- sha1
-- sha256
-- 
-- Problem is the table looks so unbalanced - the sha256 column contains much longer strings. You need to balance things up. Add '1' to the end of the 
-- md5 addresses as many times as you need to to make them the same length as those in the sha256 column. Add '0' to the beginning of the sha1 
-- values to achieve the same result.
-- 
-- Return as:
-- 
-- ** output table schema **
-- 
-- md5
-- sha1
-- sha256
-- -----------------------------------------------------------

SELECT RPAD(md5, 64, '1') AS md5, LPAD(sha1, 64, '0') AS sha1, sha256
FROM encryption;

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