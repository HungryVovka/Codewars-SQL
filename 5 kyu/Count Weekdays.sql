-- -----------------------------------------------------------
-- You need to create a function that calculates the number of weekdays (Monday through Friday) between two dates inclusively.
-- 
-- The function should be named weekdays accept two arguments of type DATE and return an INTEGER value.
-- 
-- weekdays(DATE, DATE) INTEGER
-- 
-- The order of arguments shouldn't matter. To illustrate both of the following queries
-- 
-- SELECT weekdays('2016-01-01', '2016-01-10');
-- SELECT weekdays('2016-01-10', '2016-01-01');
-- 
-- should produce the same result
-- 
--  weekdays
-- ----------
--         6
-- (1 row)
-- -----------------------------------------------------------

CREATE FUNCTION weekdays (date1 DATE, date2 DATE)
RETURNS INTEGER
AS $$
DECLARE
    calculation INTEGER := 0;
    weekday_days DATE;
BEGIN
    IF date1 > date2 THEN
        weekday_days := date1;
        date1 := date2;
        date2 := weekday_days;
    END IF;
    FOR weekday_days IN
    SELECT GENERATE_SERIES(date1, date2, '1 day') AS weekday_days
    LOOP
        IF EXTRACT(ISODOW FROM weekday_days) < 6 THEN
            calculation := calculation + 1;
        END IF;
    END LOOP;
    RETURN calculation;
END;
$$
LANGUAGE plpgsql;

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