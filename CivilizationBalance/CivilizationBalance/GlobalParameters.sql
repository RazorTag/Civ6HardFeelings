-- GlobalParameters
-- Author: EVan Norsworthy
-- DateCreated: 11/8/2017 6:01:34 PM
--------------------------------------------------------------
--War Weariness
--------------------------------------------------------------
--Reduce war weariness decay for declaring peace (default: 2000)
UPDATE GlobalParameters SET Value ='0' WHERE Name = 'WAR_WEARINESS_DECAY_PEACE_DECLARED';

--Make war weariness decay more slowly when at war (default: 50)
UPDATE GlobalParameters SET Value ='400' WHERE Name = 'WAR_WEARINESS_DECAY_TURN_AT_WAR';

--Make war weariness decay more slowly when at peace (default: 200)
UPDATE GlobalParameters SET Value ='400' WHERE Name = 'WAR_WEARINESS_DECAY_TURN_AT_PEACE';

--No war weariness from combat in allied lands (default: 1)
UPDATE GlobalParameters SET Value = '0' WHERE Name = 'WAR_WEARINESS_PER_COMBAT_IN_ALLIED_LANDS';

--Gain extra war weariness from combat in foreign lands (default: 2)
UPDATE GlobalParameters SET Value = '40' WHERE Name = 'WAR_WEARINESS_PER_COMBAT_IN_FOREIGN_LANDS';

--No war weariness from losing units (default: 3)
UPDATE GlobalParameters SET Value = '0' WHERE Name = 'WAR_WEARINESS_PER_UNIT_KILLED';

--Gain extra war weariness from launching nukes (default: 10)
UPDATE GlobalParameters SET Value = '400' WHERE Name = 'WAR_WEARINESS_PER_WMD_LAUNCHED';

--Lose amenities from war weariness faster (default: 400)
UPDATE GlobalParameters SET Value = '400' WHERE Name = 'WAR_WEARINESS_POINTS_FOR_AMENITY_LOSS';

--Unknown trigger (default: 3)
UPDATE GlobalParameters SET Value = '0' WHERE Name = 'WAR_WEARINESS_LOSS_OVER_REQ_AMENITIES_AT_WAR_CITY';

--Unknown trigger (default: 0)
UPDATE GlobalParameters SET Value = '0' WHERE Name = 'WAR_WEARINESS_LOSS_OVER_REQ_AMENITIES_FOUNDED_CITY';

--Unknown trigger (default: 1)
UPDATE GlobalParameters SET Value = '0' WHERE Name = 'WAR_WEARINESS_LOSS_OVER_REQ_AMENITIES_NONFOUNDED_CITY';


--------------------------------------------------------------
--Border Expansion
--------------------------------------------------------------
--Culture cost of the first tile expansion for a city (default: 10)
UPDATE GlobalParameters SET Value = '5' WHERE Name = 'CULTURE_COST_FIRST_PLOT';

--Culture cost of the first tile expansion for a city (default: 1.3)
UPDATE GlobalParameters SET Value = '1' WHERE Name = 'CULTURE_COST_LATER_PLOT_EXPONENT';

--Culture cost of the first tile expansion for a city (default: 6)
UPDATE GlobalParameters SET Value = '5' WHERE Name = 'CULTURE_COST_LATER_PLOT_MULTIPLIER';


--Free amenities for new cities (default: 1)
UPDATE GlobalParameters SET Value = '1' WHERE Name = 'CITY_AMENITIES_FOR_FREE';

--Faster natural spread for religion (default: 1)
UPDATE GlobalParameters SET Value = '10' WHERE Name = 'RELIGION_SPREAD_ADJACENT_PER_TURN_PRESSURE';

--Prevent the space race from hard countering tourism
UPDATE ModifierArguments SET Value = '1' WHERE ModifierId = 'PROJECT_COMPLETION_GRANT_CULTURE_BASED_ON_SCIENCE_RATE' and Name = 'Multiplier';

--Stop units from healing when they level up
UPDATE GlobalParameters SET Value = '20' WHERE Name = 'EXPERIENCE_PROMOTE_HEALED';
