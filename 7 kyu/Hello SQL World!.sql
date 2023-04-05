-- -----------------------------------------------------------
-- Hello SQL!
-- 
-- Return a table with a single column named Greeting with the phrase 'hello world!'
-- 
-- Please use Data Manipulation Language and not Data Definition Language to solve this Kata
-- -----------------------------------------------------------

-- write your select statement to return hello world

CREATE FUNCTION HELLOWORLD() RETURNS TEXT AS $$
BEGIN
    RETURN 'hello world!';
END
$$
LANGUAGE PLPGSQL;
SELECT HELLOWORLD() AS "Greeting";

-- or

CREATE TABLE HelloWorld ("Greeting" VARCHAR(50));
INSERT INTO HelloWorld ("Greeting") VALUES ('hello world!');
SELECT * FROM HelloWorld;

-- or

SELECT 'hello world!' AS "Greeting";

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