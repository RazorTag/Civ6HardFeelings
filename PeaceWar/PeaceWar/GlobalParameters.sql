-- GlobalParameters
-- Author: Evan Norsworthy
-- DateCreated: 11/4/2017 7:34:29 PM
--------------------------------------------------------------
--Combat scaling
--------------------------------------------------------------
--Reduce the impact of differences in combat strength (default: 0.04)
UPDATE GlobalParameters SET Value = '0.025' WHERE Name = 'COMBAT_POWER_SCALING';

--Scale fortification bonus slightly in excess of combat scaling nerf (default: 3)
UPDATE GlobalParameters SET Value = '6' WHERE Name = 'FORTIFY_BONUS_PER_TURN';

--Scale flanking bonus slightly in excess of combat scaling nerf (default: 2)
UPDATE GlobalParameters SET Value = '4' WHERE Name = 'COMBAT_FLANKING_BONUS_MODIFIER';

--Compensate 2-unit formations for power scaling change (default: 10)
UPDATE GlobalParameters SET Value = '13' WHERE Name = 'COMBAT_CORPS_STRENGTH_MODIFIER';

--Compensate 3-unit formations for power scaling change (default: 17)
UPDATE GlobalParameters SET Value = '22' WHERE Name = 'COMBAT_ARMY_STRENGTH_MODIFIER';
