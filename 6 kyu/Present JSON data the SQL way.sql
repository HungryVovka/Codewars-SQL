-- -----------------------------------------------------------
-- Task
-- Given the database where users are stored in JSON format, fetch the records splitting the data into separate columns.
-- 
-- Notes
-- The private field determines whether the user's email address should be publicly visible
-- If the profile is private, email_address should equal "Hidden"
-- The users may have multiple email addresses
-- If no email addresses are provided, email_address should equal "None"
-- If there're multiple email addresses, the first one should be shown
-- The date_of_birth is in the yyyy-mm-dd format
-- The age fields represents the user's age in years
-- Order the result by the first_name, and last_name columns
-- 
-- Input table
-- -------------------------
-- | Table | Column | Type |
-- |-------+--------+------|
-- | users | id     | int  |
-- |       | data   | json |
-- -------------------------
-- 
-- JSON object format
-- --------------------------------------
-- |     Field       |       Type       |
-- |-----------------+------------------|
-- | first_name      | string           |
-- | last_name       | string           |
-- | date_of_birth   | string           |
-- | email_addresses | array of strings |
-- | private         | boolean          |
-- --------------------------------------
-- 
-- Output table
-- ------------------------
-- |    Column     | Type |
-- |---------------+------|
-- | first_name    | text |
-- | last_name     | text |
-- | age           | int  |
-- | email_address | text |
-- ------------------------
-- -----------------------------------------------------------

SELECT JSON_EXTRACT_PATH_TEXT(data, 'first_name') AS first_name,
JSON_EXTRACT_PATH_TEXT(data, 'last_name') AS last_name,
EXTRACT(
    YEAR FROM AGE(
        CURRENT_DATE, DATE(
            JSON_EXTRACT_PATH_TEXT(data, 'date_of_birth')))
)::INTEGER AS age,
CASE
    WHEN JSON_EXTRACT_PATH_TEXT(data, 'private')::BOOLEAN = TRUE 
    THEN 'Hidden'
    ELSE COALESCE(
        NULLIF(
            JSON_EXTRACT_PATH_TEXT(data, 'email_addresses', '0'),
        ''),
    'None')
END
AS email_address
FROM users
ORDER BY first_name, last_name;

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