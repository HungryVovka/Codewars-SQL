-- -----------------------------------------------------------
-- Write a SELECT query which will return all prime numbers smaller than 100 in ascending order.
-- 
-- Your query should return one column named prime.
-- -----------------------------------------------------------

SELECT prime FROM GENERATE_SERIES(2, 100) AS prime
WHERE 0 <> ALL(SELECT prime % i FROM GENERATE_SERIES(2, prime - 1) AS i);

-- or

SELECT prime FROM (VALUES
                   (2), (3), (5), (7), (11),
                   (13), (17), (19), (23), (29),
                   (31), (37), (41), (43), (47),
                   (53), (59), (61), (67), (71),
                   (73), (79), (83), (89), (97))
AS TBL(prime);

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