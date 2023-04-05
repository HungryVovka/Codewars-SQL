-- -----------------------------------------------------------
-- Deep within the fair realm of Lothlórien, you have been asked to create a shortlist of candidates for a recently vacated position on the council.
-- 
-- Of so many worthy elves, who to choose for such a lofty position? After much thought you decide to select candidates by name, which are often 
-- closely aligned to an elf's skill and temperament.
-- 
-- Choose those with tegil appearing anywhere in their first name, as they are likely to be good calligraphers, OR those with astar anywhere in their 
-- last name, who will be faithful to the role.
-- 
-- Elves table:
-- 
-- firstname
-- lastname
-- 
-- all names are in lowercase
-- 
-- To aid the scribes, return the firstname and lastname column concatenated, separated by a space, into a single shortlist column, and capitalise the 
-- first letter of each name.
-- -----------------------------------------------------------

--but on the land of Lórien no shadow lay--

SELECT FORMAT('%s %s',
              INITCAP(firstname),
              INITCAP(lastname))
AS shortlist FROM elves
WHERE firstname LIKE '%tegil%' OR
      lastname LIKE '%astar%';

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