-- -----------------------------------------------------------
-- For this challenge you need to create a simple query to display each unique clan with their total points and ranked by their total points.
-- 
-- people table schema
-- name
-- points
-- clan
-- 
-- You should then return a table that resembles below
-- 
-- select on
-- rank
-- clan
-- total_points
-- total_people
-- 
-- The query must rank each clan by their total_points, you must return each unqiue clan and if there is no clan name (i.e. it's an empty string) you must 
-- replace it with [no clan specified], you must sum the total_points for each clan and the total_people within that clan.
-- 
-- ##Note The data is loaded from the live leaderboard, this means values will change but also could cause the kata to time out retreiving the 
-- information.
-- -----------------------------------------------------------

SELECT ROW_NUMBER() OVER(ORDER BY SUM(points) DESC) AS rank,
CASE
    WHEN LENGTH(clan) = 0 THEN '[no clan specified]'
    ELSE clan
END
AS clan,
SUM(points) AS total_points,
COUNT(name) AS total_people
FROM people
GROUP BY clan
ORDER BY total_points DESC;

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