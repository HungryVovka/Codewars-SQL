-- -----------------------------------------------------------
-- In baseball, the batting average is a simple and most common way to measure a hitter's performace. Batting average is calculated by taking all the 
-- players hits and dividing it by their number of at_bats, and it is usually displayed as a 3 digit decimal (i.e. 0.300).
-- 
-- Given a yankees table with the following schema,
-- 
-- -player_id STRING
-- 
-- -player_name STRING
-- 
-- -primary_position STRING
-- 
-- -games INTEGER
-- 
-- -at_bats INTEGER
-- 
-- -hits INTEGER
-- 
-- return a table with player_name, games, and batting_average.
-- 
-- We want batting_average to be rounded to the nearest thousandth, since that is how baseball fans are used to seeing it. Format it as text and 
-- make sure it has 3 digits to the right of the decimal (pad with zeroes if neccesary).
-- 
-- Next, order our resulting table by batting_average, with the highest average in the first row.
-- 
-- Finally, since batting_average is a rate statistic, a small number of at_bats can change the average dramatically. To correct for this, exclude any 
-- player who doesn't have at least 100 at bats.
-- 
-- Expected Output Table
-- 
-- -player_name STRING
-- 
-- -games INTEGER
-- 
-- -batting_average STRING
-- -----------------------------------------------------------

SELECT player_name, games,
((hits * 1.0 / at_bats)::DECIMAL(3, 3))::TEXT AS batting_average
FROM yankees WHERE at_bats >= '100'
ORDER BY batting_average DESC;

-- or

SELECT player_name, games,
((hits * 1.0 / at_bats)::NUMERIC(3, 3))::TEXT AS batting_average
FROM yankees WHERE at_bats >= '100'
ORDER BY batting_average DESC;

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