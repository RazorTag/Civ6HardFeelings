-- Buildings
-- Author: Evan Norsworthy
-- DateCreated: 10/27/2017 10:19:42 AM
--------------------------------------------------------------
--Create a precursor to ancient walls
INSERT INTO Types
		(Type,								Kind)
VALUES	('BUILDING_EPN_CITY_DEFENSES',		'KIND_BUILDING');

--Create a precursor to ancient walls
INSERT INTO Buildings	
		(BuildingType,					Name,									Description,									OuterDefenseStrength,		Cost,	PrereqTech, AdvisorType, TraitType, PrereqCivic, MaxPlayerInstances, MaxWorldInstances, Capital, PrereqDistrict, AdjacentDistrict, RequiresPlacement, RequiresRiver, OuterDefenseHitPoints, Housing, Entertainment, AdjacentResource, Coast, EnabledByReligion, AllowsHolyCity, PurchaseYield, MustPurchase, Maintenance, IsWonder, CitizenSlots, MustBeLake, MustNotBeLake, RegionalRange, AdjacentToMountain, ObsoleteEra, RequiresReligion, GrantFortification, DefenseModifier, InternalOnly, RequiresAdjacentRiver, Quote, QuoteAudio, MustBeAdjacentLand, AdjacentCapital, AdjacentImprovement, CityAdjacentTerrain)
SELECT  'BUILDING_EPN_CITY_DEFENSES',	'LOC_BUILDING_EPN_CITY_DEFENSES_NAME',	'LOC_BUILDING_EPN_CITY_DEFENSES_DESCRIPTION',	0,							1,		NULL,		AdvisorType, TraitType, PrereqCivic, MaxPlayerInstances, MaxWorldInstances, Capital, PrereqDistrict, AdjacentDistrict, RequiresPlacement, RequiresRiver, OuterDefenseHitPoints, Housing, Entertainment, AdjacentResource, Coast, EnabledByReligion, AllowsHolyCity, PurchaseYield, MustPurchase, Maintenance, IsWonder, CitizenSlots, MustBeLake, MustNotBeLake, RegionalRange, AdjacentToMountain, ObsoleteEra, RequiresReligion, GrantFortification, DefenseModifier, InternalOnly, RequiresAdjacentRiver, Quote, QuoteAudio, MustBeAdjacentLand, AdjacentCapital, AdjacentImprovement, CityAdjacentTerrain
FROM Buildings WHERE BuildingType = 'BUILDING_WALLS';

--Start each city out with city defenses
INSERT INTO StartingBuildings
		(Building,						Era,			District)
VALUES	('BUILDING_EPN_CITY_DEFENSES',	'ERA_ANCIENT',	'DISTRICT_CITY_CENTER');

--Make Medieval and Renaissance walls stronger and cheaper
UPDATE Buildings
SET Cost = Cost/2, PurchaseYield = 'YIELD_GOLD', OuterDefenseStrength = '5'
WHERE BuildingType = 'BUILDING_WALLS' OR 'BUILDING_CASTLE' OR 'BUILDING_STAR_FORT';

--Palace gives a large defensive bonus
UPDATE Buildings
SET OuterDefenseStrength = '50', OuterDefenseHitpoints = '50'
WHERE BuildingType = 'BUILDING_PALACE';
