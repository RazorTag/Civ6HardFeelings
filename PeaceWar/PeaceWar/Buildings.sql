-- Buildings
-- Author: Evan Norsworthy
-- DateCreated: 10/27/2017 10:19:42 AM
--------------------------------------------------------------
--Make ancient walls buyable, stronger, and available from the start of the game
UPDATE Buildings
SET Cost = Cost/2, PurchaseYield = 'YIELD_GOLD', OuterDefenseStrength = '5', OuterDefenseHitpoints = '100', PrereqTech = NULL
WHERE BuildingType = 'BUILDING_WALLS';

--Make Medieval walls stronger and cheaper
UPDATE Buildings
SET Cost = Cost/2, PurchaseYield = 'YIELD_GOLD', OuterDefenseStrength = '5'
WHERE BuildingType = 'BUILDING_CASTLE';

--Make Rennaissance walls stronger and cheaper
UPDATE Buildings
SET Cost = Cost/2, PurchaseYield = 'YIELD_GOLD', OuterDefenseStrength = '5'
WHERE BuildingType = 'BUILDING_STAR_FORT';

--Palace gives a large defensive bonus
UPDATE Buildings
SET OuterDefenseStrength = '100', OuterDefenseHitpoints = '100'
WHERE BuildingType = 'BUILDING_PALACE';
