-- -----------------------------------------------------------
-- Write an SQL query that:
-- 
-- Lists the names of all parties that are represented in any state whose name 
-- begins with the letter “N” (case-insensitive).
-- 
-- For each such party, computes the number of voters in each of those “N-” 
-- states.
-- 
-- Returns three columns:
-- 
-- party_name
-- 
-- state_name
-- 
-- voter_count
-- 
-- Sorts the final result first by party_name in descending order, and then 
-- (within each party) by state_name in ascending order.
-- 
-- Table schema:
-- 
-- Voters
-- Column			Key			Description
-- id				PK			Voter ID
-- gender						Gender
-- age							Age
-- degree_id		FK			References Degrees(id)
-- state_id			FK			References States(id)
-- zip_code						Postal code
-- party_id			FK			References Parties(id)
-- 
-- Degrees
-- Column			Key			Description
-- id				PK			Degree ID
-- name							Degree description
-- 
-- States
-- Column			Key			Description
-- id				PK			State ID
-- name							State name
-- 
-- Parties
-- Column			Key			Description
-- id				PK			Party ID
-- name				Party 		name
-- 
-- Example output:
-- 
-- party_name		state_name		voter_count
-- Zeta				Nebraska		1
-- Alpha			Nebraska		1
-- Alpha			New York		2
-- -----------------------------------------------------------

SELECT
    p.name AS party_name,
    s.name AS state_name,
    COUNT(v.id) AS voter_count
FROM States AS s
JOIN Voters AS v
    ON v.state_id = s.id
JOIN Parties AS p
    ON v.party_id = p.id
WHERE
    UPPER(s.name) LIKE 'N%'
GROUP BY
    p.name,
    s.name
ORDER BY
    p.name DESC,
    s.name ASC;

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