-- Barbarians
-- Author: Evan Norsworthy
-- DateCreated: 11/3/2017 9:09:54 PM
--------------------------------------------------------------
UPDATE GlobalParameters SET Value = '100' WHERE Name = 'BARBARIAN_TECH_PERCENT';

--Max barb camps per Major Civilization, default value of 3
UPDATE GlobalParameters SET Value = '2' WHERE Name = 'BARBARIAN_CAMP_MAX_PER_MAJOR_CIV';

--Min spawn distance from cities, default value of 4
UPDATE GlobalParameters SET Value = '6' WHERE Name = 'BARBARIAN_CAMP_MINIMUM_DISTANCE_CITY';
	
--Space Between Barbarian Camps, default value of 7
--UPDATE GlobalParameters SET Value = '4' WHERE Name = 'BARBARIAN_CAMP_MINIMUM_DISTANCE_ANOTHER_CAMP';

--Stop barbarians from becoming more aggressive after killing a civ's unit
UPDATE GlobalParameters SET Value = '0' WHERE Name = 'BARBARIAN_BOLDNESS_PER_KILL';

--Reduce the number of units in barbarian raids of all types
UPDATE BarbarianAttackForces
SET NumMeleeUnits = '0', NumRangeUnits = '1', NumSiegeUnits = '0'
WHERE AttackForceType = 'StandardRaid' OR AttackForceType = 'StandardAttack';
UPDATE BarbarianAttackForces
SET NumMeleeUnits = '0', NumRangeUnits = '1', NumSiegeUnits = '0'
WHERE AttackForceType = 'CavalryRaid' OR AttackForceType = 'CavalryAttack';
UPDATE BarbarianAttackForces
SET NumMeleeUnits = '0', NumRangeUnits = '1', NumSiegeUnits = '0'
WHERE AttackForceType = 'NavalRaid' OR AttackForceType = 'NavalAttack';

--Increase the passive unit spawn rate of barbarian camps (default: 15 for melee and naval, 25 for cavalry)
--UPDATE BarbarianTribes
--SET TurnsToWarriorSpawn = '10'
--WHERE TribeType = 'TRIBE_NAVAL' OR TribeType = 'TRIBE_CAVALRY' OR TribeType = 'TRIBE_MELEE';
