-- Buildings
-- Author: Evan Norsworthy
-- DateCreated: 10/27/2017 10:19:42 AM
--------------------------------------------------------------
UPDATE Buildings
SET PurchaseYield = 'YIELD_GOLD', OuterDefenseStrength = '5'
WHERE BuildingType = 'BUILDING_WALLS';

--Make Medieval and Renaissance walls stronger and cheaper, and buyable
UPDATE Buildings
SET Cost = Cost/2, PurchaseYield = 'YIELD_GOLD', OuterDefenseStrength = '5'
WHERE BuildingType = 'BUILDING_CASTLE' OR BuildingType = 'BUILDING_STAR_FORT';

--Palace gives a large defensive bonus
UPDATE Buildings
SET OuterDefenseStrength = '50', OuterDefenseHitpoints = '100'
WHERE BuildingType = 'BUILDING_PALACE';


--------------------------------------------------------------
--Inherent city defenses
--------------------------------------------------------------
--Create a precursor to ancient walls
INSERT INTO Types
		(Type,								Kind)
VALUES	('BUILDING_EPN_CITY_DEFENSES',		'KIND_BUILDING');

--Create a precursor to ancient walls (Castrum)
INSERT INTO Buildings	
		(BuildingType,					Name,									Description,									OuterDefenseStrength,	OuterDefenseHitPoints,	Entertainment,		Cost,	PrereqTech, MaxPlayerInstances, MustPurchase,	PurchaseYield,	AdvisorType, TraitType, PrereqCivic, MaxWorldInstances, Capital, PrereqDistrict, AdjacentDistrict, RequiresPlacement, RequiresRiver, Housing, AdjacentResource, Coast, EnabledByReligion, AllowsHolyCity, Maintenance, IsWonder, CitizenSlots, MustBeLake, MustNotBeLake, RegionalRange, AdjacentToMountain, ObsoleteEra, RequiresReligion, GrantFortification, DefenseModifier, InternalOnly, RequiresAdjacentRiver, Quote, QuoteAudio, MustBeAdjacentLand, AdjacentCapital, AdjacentImprovement, CityAdjacentTerrain)
SELECT  'BUILDING_EPN_CITY_DEFENSES',	'LOC_BUILDING_EPN_CITY_DEFENSES_NAME',	'LOC_BUILDING_EPN_CITY_DEFENSES_DESCRIPTION',	50,						100,					3,					1,		NULL,		3,					1,				NULL,			AdvisorType, TraitType, PrereqCivic, MaxWorldInstances, Capital, PrereqDistrict, AdjacentDistrict, RequiresPlacement, RequiresRiver, Housing, AdjacentResource, Coast, EnabledByReligion, AllowsHolyCity, Maintenance, IsWonder, CitizenSlots, MustBeLake, MustNotBeLake, RegionalRange, AdjacentToMountain, ObsoleteEra, RequiresReligion, GrantFortification, DefenseModifier, InternalOnly, RequiresAdjacentRiver, Quote, QuoteAudio, MustBeAdjacentLand, AdjacentCapital, AdjacentImprovement, CityAdjacentTerrain
FROM Buildings WHERE BuildingType = 'BUILDING_WALLS';

--Hide the Castrum in the Civilopedia
INSERT INTO CivilopediaPageExcludes (SectionId, PageId) VALUES ('BUILDINGS', 'BUILDING_EPN_CITY_DEFENSES');

--Make a castrum spawn in the city center of every new city
INSERT INTO DistrictModifiers (DistrictType, ModifierId)
VALUES ('DISTRICT_CITY_CENTER', 'BUILDING_CITY_DEFENSES_MODIFIER');
--
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES ('BUILDING_CITY_DEFENSES_MODIFIER', 'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY', 0, 1, NULL, NULL);
--
INSERT INTO ModifierArguments (ModifierId, Name, Type, Value, Extra, SecondExtra)
VALUES ('BUILDING_CITY_DEFENSES_MODIFIER', 'BuildingType', 'ARGTYPE_IDENTITY', 'BUILDING_EPN_CITY_DEFENSES', NULL, NULL);
