-- -----------------------------------------------------------
-- You are given a table box with the following columns: width (int), height (int), depth (int). Those values will be greater than 0.
-- 
-- Write an SQL query that returns these columns:
-- 
-- width
-- height
-- depth
-- area (int) - the total surface area of the box.
-- volume (int) - the volume of the box. Sort the results by area ascending, then by volume ascending, then by width ascending, and finally by 
-- height in ascending order.
-- -----------------------------------------------------------

-- # write your SQL statement here: 
-- you are given a table 'box' with columns: width (int), height (int), depth (int)
-- return a query with columns: width, height, depth, area (int), volume (int)
-- sort results by area ascending, then volume ascending, then width ascending, then height ascending

SELECT width, height, depth,
(width * height + width * depth + height * depth) * 2 AS area,
(width * height * depth) AS volume
FROM box
ORDER BY area ASC, volume ASC, width ASC, height ASC;

-- -----------------------------------------------------------
-- License
-- Tasks are the property of Codewars (https://www.codewars.com/) 
-- and users of this resource.
-- 
-- All solution code in this repository 
-- is the personal property of Vladimir Rukavishnikov
-- (vladimirrukavishnikovmail@gmail.com).
-- 
-- Copyright (C) 2025 Vladimir Rukavishnikov
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