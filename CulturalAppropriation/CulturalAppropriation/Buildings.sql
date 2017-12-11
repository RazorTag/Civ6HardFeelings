-- Buildings
-- Author: enors
-- DateCreated: 12/9/2017 3:42:49 AM
--------------------------------------------------------------
--Give the palace more wild card great work slots instead of (still no theming bonuses) (default: 1)
UPDATE Building_GreatWorks SET NumSlots = '3' WHERE BuildingType = 'BUILDING_PALACE';

--Add housing to some museums and temples
--UPDATE Buildings SET Housing = 1 WHERE
--BuildingType = 'BUILDING_MUSEUM_ART' OR 
--BuildingType = 'BUILDING_MUSEUM_ARTIFACT' OR
--BuildingType = 'BUILDING_TEMPLE' OR
--BuildingType = 'BUILDING_STAVE_CHURCH';