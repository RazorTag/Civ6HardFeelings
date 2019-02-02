-- GlobalParameters
-- Author: Doomturtle
-- DateCreated: 11/10/2017 1:08:08 PM
--------------------------------------------------------------
--Religion
--------------------------------------------------------------
--Faster natural spread for religion (default: 1)
UPDATE GlobalParameters SET Value = '2' WHERE Name = 'RELIGION_SPREAD_ADJACENT_PER_TURN_PRESSURE';

--Condemning religious units does not remove their religion from nearby cities
UPDATE GlobalParameters SET Value = '0' WHERE Name = 'RELIGION_SPREAD_UNIT_CAPTURE';


--------------------------------------------------------------
--Tourism
--------------------------------------------------------------
-- Reduce amount of tourism needed for foreign tourist from 200 to 135
UPDATE GlobalParameters SET Value='135' WHERE Name='TOURISM_TOURISM_TO_MOVE_CITIZEN';

--Prevent the space race from hard countering tourism (default: 10)
UPDATE ModifierArguments SET Value = '1' WHERE ModifierId = 'PROJECT_COMPLETION_GRANT_CULTURE_BASED_ON_SCIENCE_RATE' and Name = 'Multiplier';


--------------------------------------------------------------
--Border Expansion (CULTURE_COST_FIRST_PLOT + ((CULTURE_COST_LATER_PLOT_MULTIPLIER * n) ^ CULTURE_COST_LATER_PLOT_EXPONENT))
--------------------------------------------------------------
--Culture cost of the first tile expansion for a city (default: 10)
UPDATE GlobalParameters SET Value = '5' WHERE Name = 'CULTURE_COST_FIRST_PLOT';

--Growth rate exponent (default: 1.3)
UPDATE GlobalParameters SET Value = '1.1' WHERE Name = 'CULTURE_COST_LATER_PLOT_EXPONENT';

--Proportionally scales the growth rate (default: 6)
UPDATE GlobalParameters SET Value = '6' WHERE Name = 'CULTURE_COST_LATER_PLOT_MULTIPLIER';
