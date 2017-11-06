-- GlobalParameters
-- Author: Evan Norsworthy
-- DateCreated: 11/4/2017 7:34:29 PM
--------------------------------------------------------------
--Get rid of free war weariness decay just for declaring peace (default: 2000)
UPDATE GlobalParameters SET Value ='0' WHERE Name = 'WAR_WEARINESS_DECAY_PEACE_DECLARED';

--Make war weariness decay more slowly when at peace (default: 200)
UPDATE GlobalParameters SET Value ='100' WHERE Name = 'WAR_WEARINESS_DECAY_TURN_AT_PEACE';

--Lose war weariness from combat in allied lands (default: 1)
UPDATE GlobalParameters SET Value = '-10' WHERE Name = 'WAR_WEARINESS_PER_COMBAT_IN_ALLIED_LANDS';

--Gain extra war weariness from combat in foreign lands (default: 2)
UPDATE GlobalParameters SET Value ='5' WHERE Name = 'WAR_WEARINESS_PER_COMBAT_IN_FOREIGN_LANDS';

--Gain extra war weariness from killing units (default: 3)
UPDATE GlobalParameters SET Value ='10' WHERE Name = 'WAR_WEARINESS_PER_UNIT_KILLED';

--Gain extra war weariness from launching nukes (default: 10)
UPDATE GlobalParameters SET Value ='100' WHERE Name = 'WAR_WEARINESS_PER_WMD_LAUNCHED';

--Reduce the impact of differences in combat strength
UPDATE GlobalParameters SET Value = '0.02' WHERE Name = 'COMBAT_POWER_SCALING';
