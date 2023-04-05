-- -----------------------------------------------------------
-- Practise some SQL fundamentals by making a simple database on a topic you feel familiar with. Or use mine, populated with a wealth of Sailor Moon 
-- trivia.
-- 
-- sailorsenshi schema
-- id
-- senshi_name
-- real_name_jpn
-- school_id
-- cat_id
-- 
-- cats schema
-- id
-- name
-- 
-- schools schema
-- id
-- school
-- 
-- Return a results table - sailor_senshi, real_name, cat and school - of all characters, containing each character's high school, their civilian name and the 
-- cat who introduced them to their magical crime-fighting destiny.
-- 
-- Keep in mind some senshi were not initiated by a cat guardian and one is not in high school. The field can be left blank if this is the case.
-- -----------------------------------------------------------

SELECT senshi_name AS sailor_senshi,
       real_name_jpn AS real_name,
       cats.name AS cat,
       school
FROM sailorsenshi
LEFT JOIN cats ON cats.id = cat_id
LEFT JOIN schools ON schools.id = school_id;

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