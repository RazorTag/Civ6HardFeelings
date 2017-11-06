-- GameText
-- Author: enors
-- DateCreated: 10/27/2017 1:01:02 PM
--------------------------------------------------------------
--ancient walls
UPDATE LocalizedText
SET	Text = 'Provides Walls around the City Center and Encampment district. Ancient walls provide 10 [ICON_Strength] Melee Strength, 100 Hitpoints, and allows [ICON_Ranged] Ranged Strikes from the City Center and Encampment district. Must be defeated before a city can be assaulted. Provides 1 [ICON_TOURISM] Tourism after advancing to the Conservation Civic.'
WHERE Tag = 'LOC_BUILDING_WALLS_DESCRIPTION';

--medieval walls
UPDATE LocalizedText
SET Text = 'Increases your outer defenses by 5 [ICON_Strength] Melee Strength and 50 Hitpoints. Provides 2 [ICON_TOURISM] Tourism after advancing to the Conservation Civic.'
WHERE Tag = 'LOC_BUILDING_CASTLE_DESCRIPTION';

--Renaissance walls
UPDATE LocalizedText
SET Text = 'Raises your outer defenses by 5 [ICON_Strength] Melee Strength and 50 Hitpoints. Provides 3 [ICON_TOURISM] Tourism after advancing to the Conservation Civic.'
WHERE Tag = 'LOC_BUILDING_STAR_FORT_DESCRIPTION';

