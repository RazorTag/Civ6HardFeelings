-- Buildings
-- Author: enors
-- DateCreated: 11/9/2017 10:16:20 PM
--------------------------------------------------------------
--Inherent amenities for first four cities
--------------------------------------------------------------
--Amenities building
INSERT INTO Types
		(Type,								Kind)
VALUES	('BUILDING_EPN_HAPPINESS',		'KIND_BUILDING');

--Create a dummy happiness building
INSERT INTO Buildings	
		(BuildingType,				Name,								Description,								Cost,	PrereqDistrict,			Entertainment,	MaxPlayerInstances)
VALUES  ('BUILDING_EPN_HAPPINESS',	'LOC_BUILDING_EPN_HAPPINESS_NAME',	'LOC_BUILDING_EPN_HAPPINESS_DESCRIPTION',	1,		'DISTRICT_CITY_CENTER',	4,				4);

--Hide the happiness building in the Civilopedia
INSERT INTO CivilopediaPageExcludes (SectionId, PageId) VALUES ('BUILDINGS', 'BUILDING_EPN_HAPPINESS');

--Make a happiness building spawn in the city center of the first four new cities
INSERT INTO DistrictModifiers (DistrictType, ModifierId)
VALUES ('DISTRICT_CITY_CENTER', 'BUILDING_HAPPINESS_MODIFIER');
--
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES ('BUILDING_HAPPINESS_MODIFIER', 'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY', 0, 1, NULL, NULL);
--
INSERT INTO ModifierArguments (ModifierId, Name, Type, Value, Extra, SecondExtra)
VALUES ('BUILDING_HAPPINESS_MODIFIER', 'BuildingType', 'ARGTYPE_IDENTITY', 'BUILDING_EPN_HAPPINESS', NULL, NULL);
