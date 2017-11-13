-- GlobalParameters
-- Author: enors
-- DateCreated: 11/10/2017 1:08:08 PM
--------------------------------------------------------------
--Prevent the space race from hard countering tourism
UPDATE ModifierArguments SET Value = '1' WHERE ModifierId = 'PROJECT_COMPLETION_GRANT_CULTURE_BASED_ON_SCIENCE_RATE' and Name = 'Multiplier';

--Stop units from healing when they level up
UPDATE GlobalParameters SET Value = '20' WHERE Name = 'EXPERIENCE_PROMOTE_HEALED';

--Max distance that borders can spread from a city (default: 5)
UPDATE GlobalParameters SET Value = '15' WHERE Name = 'PLOT_INFLUENCE_MAX_ACQUIRE_DISTANCE';