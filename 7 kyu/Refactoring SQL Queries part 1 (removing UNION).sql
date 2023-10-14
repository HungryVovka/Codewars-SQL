-- -----------------------------------------------------------
-- As a newly hired developer at a startup, you've been tasked with refactoring the existing codebase. As usually happens in startups, the initial code 
-- has been written by a bunch of students that were doing it for free. Sinking more and more into depression as you study the code, you stumbled 
-- upon this gem:
-- 
-- SELECT * FROM (
--   SELECT DISTINCT city_name FROM stations WHERE city_name LIKE 'A%'
--   UNION
--   SELECT DISTINCT city_name FROM stations WHERE city_name LIKE 'E%'
--   UNION
--   SELECT DISTINCT city_name FROM stations WHERE city_name LIKE 'I%'
--   UNION
--   SELECT DISTINCT city_name FROM stations WHERE city_name LIKE 'O%'
--   UNION
--   SELECT DISTINCT city_name FROM stations WHERE city_name LIKE 'U%'
-- ) AS subquery
-- ORDER BY city_name ASC;
-- 
-- You need to do the refactoring of the above query without using the UNION operator.
-- 
-- The schema of stations table is following:
-- 
-- id (integer): primary key
-- city_name (string): the name of the city
-- 
-- GLHF!
-- -----------------------------------------------------------

SELECT DISTINCT city_name
FROM stations
WHERE city_name LIKE ANY(ARRAY['A%', 'E%', 'I%', 'O%', 'U%'])
ORDER BY city_name;

-- or

SELECT DISTINCT city_name
FROM stations
WHERE substr(city_name, 1, 1) IN ('A', 'E', 'I', 'O', 'U')
ORDER BY city_name;

-- or

SELECT DISTINCT city_name
FROM stations
WHERE LEFT(city_name, 1) IN ('A', 'E', 'I', 'O', 'U')
ORDER BY city_name;

-- or

SELECT DISTINCT city_name
FROM stations
WHERE city_name ~'^(A|E|I|O|U)'
ORDER BY city_name;

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