-- -----------------------------------------------------------
-- Develop a SQL query to analyze and report the most popular public email 
-- domains used by users in a database. A 'public domain' in this context refers to 
-- widely-used, generally accessible email services such as 'gmail.com', 'yahoo.com', 
-- 'hotmail.com', etc. These are contrasted with private or less common email 
-- domains that might be used by specific organizations or less known email 
-- services.
-- 
-- For the purposes of this task, an "email address" is defined as a string in the basic 
-- format of localpart@domain.com. Complex email formats, such as those 
-- containing multiple '@' symbols or quoted local parts, are excluded from this 
-- task.
-- 
-- You have been provided with a PostgreSQL database that contains a table 
-- named users. This table includes user email addresses among other details. 
-- There is also a table named public_domains that lists known public email 
-- domains.
-- 
-- users:
-- 
-- id (int): primary key
-- email (varchar, unique): The email address of the user.
-- 
-- public_domains:
-- 
-- domain (varchar, primary key): A known public email domain (e.g., 
-- 'gmail.com', 'yahoo.com').
-- 
-- Write a SQL query that performs the following operations:
-- 
-- Extracts and counts public domain email addresses from the users table, 
-- using the public_domains table for reference.
-- Filters out non-public email addresses.
-- Aggregates the data to count the number of users per public domain.
-- Sorts the result in descending order based on the count of users per domain 
-- with a secondary sorting criterion that sorts alphabetically by domain in 
-- case of a tie in the counts.
-- 
-- The query should output a result set with the following columns:
-- 
-- domain (varchar): The public domain extracted from the email addresses.
-- user_count (int): The number of users associated with each public domain.
-- 
-- Desired Output
-- The desired output should look like this:
-- 
-- domain				user_count
-- gmail.com			4
-- aol.com				3
-- hotmail.com			3
-- mail.com				3
-- ...
-- 
-- GLHF!
-- -----------------------------------------------------------

WITH user_domains AS (
    SELECT
        u.id,
        LOWER(split_part(u.email, '@', 2)) AS domain
    FROM users AS u
)
SELECT
    pd.domain,
    COUNT(*) AS user_count
FROM user_domains AS ud
JOIN public_domains AS pd
    ON ud.domain = LOWER(pd.domain)
GROUP BY
    pd.domain
ORDER BY
    user_count DESC,
    pd.domain ASC;

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