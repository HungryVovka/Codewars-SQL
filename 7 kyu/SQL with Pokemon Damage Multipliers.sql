-- -----------------------------------------------------------
-- You have arrived at the Celadon Gym to battle Erika for the Rainbow Badge.
-- 
-- She will be using Grass-type Pokemon. Any fire pokemon you have will be strong against grass, but your water types will be weakened. The 
-- multipliers table within your Pokedex will take care of that.
-- 
-- Using the following tables, return the pokemon_name, modifiedStrength and element of the Pokemon whose strength, after taking these changes 
-- into account, is greater than or equal to 40, ordered from strongest to weakest.
-- 
-- pokemon schema
-- 
-- id
-- pokemon_name
-- element_id
-- str
-- 
-- multipliers schema
-- 
-- id
-- element
-- multiplier
-- -----------------------------------------------------------

-- i choose you! --

SELECT * FROM(
    SELECT pokemon_name, multiplier * str AS modifiedStrength, element
    FROM pokemon
    INNER JOIN multipliers ON multipliers.id = pokemon.element_id)
AS DamageMultipliers
WHERE modifiedStrength >= 40
ORDER BY modifiedStrength DESC;

-- or

SELECT pokemon_name, multiplier * str AS modifiedStrength, element
FROM pokemon
INNER JOIN multipliers ON multipliers.id = pokemon.element_id
WHERE multiplier * str >= 40
ORDER BY modifiedStrength DESC;

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