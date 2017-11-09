-- GameText
-- Author: enors
-- DateCreated: 10/27/2017 1:01:02 PM
--------------------------------------------------------------
--ancient walls
UPDATE LocalizedText
SET	Text = 'Increases city defenses by 5 [ICON_Strength] Melee Strength and 50 Hitpoints. Provides 1 [ICON_TOURISM] Tourism after advancing to the Conservation Civic.'
WHERE Tag = 'LOC_BUILDING_WALLS_DESCRIPTION';

--medieval walls
UPDATE LocalizedText
SET Text = 'Increases city defenses by 5 [ICON_Strength] Melee Strength and 50 Hitpoints. Provides 2 [ICON_TOURISM] Tourism after advancing to the Conservation Civic.'
WHERE Tag = 'LOC_BUILDING_CASTLE_DESCRIPTION';

--Renaissance walls
UPDATE LocalizedText
SET Text = 'Increases city defenses by 5 [ICON_Strength] Melee Strength and 50 Hitpoints. Provides 3 [ICON_TOURISM] Tourism after advancing to the Conservation Civic.'
WHERE Tag = 'LOC_BUILDING_STAR_FORT_DESCRIPTION';

