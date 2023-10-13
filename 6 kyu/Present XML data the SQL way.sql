-- -----------------------------------------------------------
-- Task
-- Given the database where all the users' data is stored in one huge XML string, fetch it as separate rows and columns.
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
-- |       | data   | xml  |
-- -------------------------
-- 
-- XML format
-- <data>
--     <user>
--         <first_name>...</first_name>
--         <last_name>...</last_name>
--         <date_of_birth>...</date_of_birth>
--         <private>...</private>
--         <email_addresses>
--             <address>...</address>
--             <address>...</address>
--             ...
--             <address>...</address>
--         </email_addresses>
--     </user>
--     <user>...</user>
--     ...
--     <user>...</user>
-- </data>
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

CREATE FUNCTION present_xml_data(xml_data XML)
RETURNS TABLE (
    first_name TEXT,
    last_name TEXT,
    date_of_birth DATE,
    private BOOLEAN,
    email_adress TEXT
)
AS $$
BEGIN
    RETURN QUERY SELECT
        (XPATH('/user/first_name/text()', U))[1]::TEXT,
        (XPATH('/user/last_name/text()', U))[1]::TEXT,
        TO_DATE((XPATH('/user/date_of_birth/text()', U))[1]::TEXT,
               'YYYY-MM-DD'),
        CASE
            WHEN (XPATH('/user/private/text()', U))[1]::TEXT = 'true'
            THEN TRUE
            ELSE FALSE
        END,
        COALESCE(
            (XPATH('/user/email_addresses/address[1]/text()', U)
            )[1]::TEXT, 'None'
        )
    FROM UNNEST(XPATH('/data/user', xml_data)) AS U;
END;
$$
LANGUAGE plpgsql;

SELECT first_name, last_name,
EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth))::INTEGER AS age,
CASE
    WHEN private THEN 'Hidden'
    ELSE email_adress
END
AS email_address
FROM present_xml_data((SELECT DATA FROM users))
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