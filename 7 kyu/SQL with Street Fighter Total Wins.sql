-- -----------------------------------------------------------
-- It's time to assess which of the world's greatest fighters are through to the 6 coveted places in the semi-finals of the Street Fighter World Fighting 
-- Championship. Every fight of the year has been recorded and each fighter's wins and losses need to be added up.
-- 
-- Each row of the table fighters records, alongside the fighter's name, whether they won (1) or lost (0), as well as the type of move that ended the 
-- bout.
-- 
-- id
-- name
-- won
-- lost
-- move_id
-- 
-- winning_moves
-- 
-- id
-- move
-- However, due to new health and safety regulations, all ki blasts have been outlawed as a potential fire hazard. Any bout that ended with 
-- Hadoken, Shouoken or Kikoken should not be counted in the total wins and losses.
-- 
-- So, your job:
-- 
-- Return name, won, and lost columns displaying the name, total number of wins and total number of losses. Group by the fighter's name.
-- Do not count any wins or losses where the winning move was Hadoken, Shouoken or Kikoken.
-- Order from most-wins to least
-- Return the top 6. Don't worry about ties.
-- -----------------------------------------------------------

--- 3, 2, 1, fight! ---

SELECT name, SUM(won) AS won, SUM(lost) AS lost FROM fighters
JOIN winning_moves ON fighters.move_id = winning_moves.id
WHERE winning_moves.move NOT IN ('Hadoken', 'Kikoken', 'Shouoken')
GROUP BY name ORDER BY SUM(won) DESC LIMIT 6;

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