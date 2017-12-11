-- Districts
-- Author: enors
-- DateCreated: 11/9/2017 1:36:24 PM
--------------------------------------------------------------
--Increase specialist yields to 3
UPDATE District_CitizenYieldChanges SET YieldChange = 3 WHERE (DistrictType = 'DISTRICT_HOLY_SITE' OR DistrictType = 'DISTRICT_LAVRA') AND YieldType = 'YIELD_FAITH';
UPDATE District_CitizenYieldChanges SET YieldChange = 3 WHERE DistrictType = 'DISTRICT_CAMPUS' AND YieldType = 'YIELD_SCIENCE';
UPDATE District_CitizenYieldChanges SET YieldChange = 2 WHERE DistrictType = 'DISTRICT_ENCAMPMENT' AND YieldType = 'YIELD_PRODUCTION';
UPDATE District_CitizenYieldChanges SET YieldChange = 2 WHERE (DistrictType = 'DISTRICT_HARBOR' OR DistrictType = 'DISTRICT_ROYAL_NAVY_DOCKYARD') AND YieldType = 'YIELD_SCIENCE';
UPDATE District_CitizenYieldChanges SET YieldChange = 6 WHERE DistrictType = 'DISTRICT_COMMERCIAL_HUB' AND YieldType = 'YIELD_GOLD';
UPDATE District_CitizenYieldChanges SET YieldChange = 3 WHERE (DistrictType = 'DISTRICT_THEATER' OR DistrictType = 'DISTRICT_ACROPOLIS') AND YieldType = 'YIELD_CULTURE';
UPDATE District_CitizenYieldChanges SET YieldChange = 3 WHERE (DistrictType = 'DISTRICT_INDUSTRIAL_ZONE' OR DistrictType = 'DISTRICT_HANSA') AND YieldType = 'YIELD_PRODUCTION';

--Add 1 food yield for each specialist to simulate specialists requiring only 1 food
REPLACE INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange)
SELECT DistrictType, 'YIELD_FOOD', 1
FROM District_CitizenYieldChanges;

--Each district provides at least 1 housing
UPDATE Districts SET Housing = MAX(1, Housing) WHERE NOT (DistrictType = 'DISTRICT_WONDER' OR DistrictType = 'DISTRICT_AQUEDUCT' OR DistrictType = 'DISTRICT_CITY_CENTER');

--Set other districts to cost more based on previous copies
UPDATE Districts SET CostProgressionModel = 'COST_PROGRESSION_PREVIOUS_COPIES', CostProgressionParam1 = Cost/2
WHERE
  DistrictType = 'DISTRICT_AERODROME' OR
  DistrictType = 'DISTRICT_CAMPUS' OR
  DistrictType = 'DISTRICT_COMMERCIAL_HUB' OR
  DistrictType = 'DISTRICT_ENCAMPMENT' OR
  DistrictType = 'DISTRICT_ENTERTAINMENT_COMPLEX' OR
  DistrictType = 'DISTRICT_HARBOR' OR
  DistrictType = 'DISTRICT_HOLY_SITE' OR
  DistrictType = 'DISTRICT_INDUSTRIAL_ZONE' OR
  DistrictType = 'DISTRICT_THEATER' OR
  DistrictType = 'DISTRICT_ACROPOLIS' OR
  DistrictType = 'DISTRICT_LAVRA' OR
  DistrictType = 'DISTRICT_ROYAL_NAVY_DOCKYARD' OR
  DistrictType = 'DISTRICT_STREET_CARNIVAL' OR
  DistrictType = 'DISTRICT_HANSA';

--Tier 1 districts
UPDATE Districts SET Cost = '60' WHERE
  DistrictType = 'DISTRICT_CAMPUS' OR
  DistrictType = 'DISTRICT_ENCAMPMENT' OR
  DistrictType = 'DISTRICT_HOLY_SITE' OR
  DistrictType = 'DISTRICT_THEATER' OR
  DistrictType = 'DISTRICT_HARBOR';

--Tier 2 districts
UPDATE Districts SET Cost = '90' WHERE
  DistrictType = 'DISTRICT_COMMERCIAL_HUB' OR
  DistrictType = 'DISTRICT_ENTERTAINMENT_COMPLEX' OR
  DistrictType = 'DISTRICT_INDUSTRIAL_ZONE';

--Tier 4 districts
UPDATE Districts SET Cost = '120' WHERE
  DistrictType = 'DISTRICT_AERODROME';

--Set unique districts to half the cost of the district that they replace
UPDATE Districts
	SET Cost = 
	(
		SELECT .5*Cost
		FROM Districts AS d
		JOIN DistrictReplaces
		ON d.DistrictType = DistrictReplaces.ReplacesDistrictType
		WHERE Districts.DistrictType = DistrictReplaces.CivUniqueDistrictType
	)
	WHERE DistrictType IN
	(
		SELECT DISTINCT CivUniqueDistrictType
		FROM DistrictReplaces
	);
