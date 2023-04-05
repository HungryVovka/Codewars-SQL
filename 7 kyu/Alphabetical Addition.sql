-- -----------------------------------------------------------
-- Your task is to add up letters to one letter.
-- 
-- In SQL, you will be given a table letters, with a string column letter. Return the sum of the letters in a column letter.
-- 
-- Notes:
-- Letters will always be lowercase.
-- Letters can overflow (see second to last example of the description)
-- If no letters are given, the function should return 'z'
-- 
-- Examples:
-- table(letter: ["a", "b", "c"]) = "f"
-- table(letter: ["a", "b"]) = "c"
-- table(letter: ["z"]) = "z"
-- table(letter: ["z", "a"]) = "a"
-- table(letter: ["y", "c", "b"]) = "d" -- notice the letters overflowing
-- table(letter: []) = "z"
-- 
-- Confused? Roll your mouse/tap over here
-- -----------------------------------------------------------

SELECT
CASE
    WHEN SUM(ASCII(letter) - 96) % 26 = 0
        THEN 'z'
    WHEN SUM(ASCII(letter) - 96) <= 26
        THEN CHR(CAST(SUM(ASCII(letter) - 96) AS INT) + 96)
    WHEN SUM(ASCII(letter) - 96) > 26
        THEN CHR(CAST(SUM(ASCII(letter) - 96) % 26 AS INT) + 96)
    ELSE 'z'
END
AS letter FROM letters;

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