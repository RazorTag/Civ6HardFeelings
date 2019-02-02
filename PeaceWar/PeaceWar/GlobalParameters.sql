-- GlobalParameters
-- Author: Doomturtle
-- DateCreated: 11/4/2017 7:34:29 PM
--------------------------------------------------------------
--Combat power scaling
--------------------------------------------------------------
----Reduce the impact of differences in combat strength (default: 0.04)
--UPDATE GlobalParameters SET Value = '0.025' WHERE Name = 'COMBAT_POWER_SCALING';

----Compensate 2-unit formations for power scaling change (default: 10)
--UPDATE GlobalParameters SET Value = '16' WHERE Name = 'COMBAT_CORPS_STRENGTH_MODIFIER';
--
----Compensate 3-unit formations for power scaling change (default: 17)
--UPDATE GlobalParameters SET Value = '27' WHERE Name = 'COMBAT_ARMY_STRENGTH_MODIFIER';
--
----Scale fortification bonus (default: 3)
--UPDATE GlobalParameters SET Value = '5' WHERE Name = 'FORTIFY_BONUS_PER_TURN';
--
----Scale flanking bonus (default: 2)
--UPDATE GlobalParameters SET Value = '5' WHERE Name = 'COMBAT_FLANKING_BONUS_MODIFIER';
--
----Scale river defense bonus (default: 5)
--UPDATE GlobalParameters SET Value = '10' WHERE Name = 'COMBAT_RIVER_DEFENSE';


--------------------------------------------------------------
--Combat triangle
--------------------------------------------------------------