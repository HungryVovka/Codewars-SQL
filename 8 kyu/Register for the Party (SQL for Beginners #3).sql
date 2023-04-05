-- -----------------------------------------------------------
-- You received an invitation to an amazing party. Now you need to write an insert statement to add yourself to the table of participants.
-- 
-- participants table schema
-- 
-- name (string)
-- age (integer)
-- attending (boolean)
-- 
-- NOTES:
-- 
-- Since alcohol will be served, you can only attend if you are 21 or older
-- You can't attend if the attending column returns anything but true
-- 
-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases just to validate your answer.
-- -----------------------------------------------------------

INSERT INTO participants VALUES ('HungryVovka', '28', TRUE);
SELECT * FROM participants;

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