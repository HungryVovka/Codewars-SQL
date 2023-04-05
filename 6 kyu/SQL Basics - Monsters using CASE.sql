-- -----------------------------------------------------------
-- You have access to two tables named top_half and bottom_half, as follows:
-- 
-- top_half schema
-- 
-- id
-- heads
-- arms
-- bottom_half schema
-- 
-- id
-- legs
-- tails
-- You must return a table with the format as follows:
-- 
-- output schema
-- 
-- id
-- heads
-- legs
-- arms
-- tails
-- species
-- The IDs on the tables match to make a full monster. For heads, arms, legs and tails you need to draw in the data from each table.
-- 
-- For the species, if the monster has more heads than arms, more tails than legs, or both, it is a 'BEAST' else it is a 'WEIRDO'. This needs to be captured 
-- in the species column.
-- 
-- All rows should be returned (10).
-- 
-- Tests require the use of CASE. Order by species.
-- -----------------------------------------------------------

SELECT top_half.id,
top_half.heads,
bottom_half.legs,
top_half.arms,
bottom_half.tails,
CASE
    WHEN heads > arms OR tails > legs THEN 'BEAST'
    ELSE 'WEIRDO'
END
AS species
FROM top_half
INNER JOIN bottom_half ON bottom_half.id = top_half.id
ORDER BY species;

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