-- Districts
-- Author: Doomturtle
-- DateCreated: 11/9/2017 1:36:24 PM
--------------------------------------------------------------

--Double specialist yields
UPDATE District_CitizenYieldChanges SET YieldChange=2*YieldChange;

----Prevent Better Balanced Game from buffing specialist yields by settings them to their standard values.
--UPDATE District_CitizenYieldChanges SET YieldChange=2 WHERE YieldType='YIELD_CULTURE' 		AND DistrictType="DISTRICT_ACROPOLIS";
--UPDATE District_CitizenYieldChanges SET YieldChange=2 WHERE YieldType='YIELD_SCIENCE' 		AND DistrictType="DISTRICT_CAMPUS";
--UPDATE District_CitizenYieldChanges SET YieldChange=4 WHERE YieldType='YIELD_GOLD' 			AND DistrictType="DISTRICT_COMMERCIAL_HUB";
--UPDATE District_CitizenYieldChanges SET YieldChange=1 WHERE YieldType='YIELD_PRODUCTION' 	AND DistrictType="DISTRICT_ENCAMPMENT";
--UPDATE District_CitizenYieldChanges SET YieldChange=1 WHERE YieldType='YIELD_PRODUCTION' 	AND DistrictType="DISTRICT_IKANDA";
--UPDATE District_CitizenYieldChanges SET YieldChange=2 WHERE YieldType='YIELD_GOLD' 			AND DistrictType="DISTRICT_HARBOR";
--UPDATE District_CitizenYieldChanges SET YieldChange=2 WHERE YieldType='YIELD_FAITH' 		AND DistrictType="DISTRICT_HOLY_SITE";
--UPDATE District_CitizenYieldChanges SET YieldChange=2 WHERE YieldType='YIELD_PRODUCTION' 	AND DistrictType="DISTRICT_INDUSTRIAL_ZONE";
--UPDATE District_CitizenYieldChanges SET YieldChange=2 WHERE YieldType='YIELD_PRODUCTION' 	AND DistrictType="DISTRICT_HANSA";
--UPDATE District_CitizenYieldChanges SET YieldChange=2 WHERE YieldType='YIELD_FAITH' 		AND DistrictType="DISTRICT_LAVRA";
--UPDATE District_CitizenYieldChanges SET YieldChange=2 WHERE YieldType='YIELD_GOLD' 			AND DistrictType="DISTRICT_ROYAL_NAVY_DOCKYARD";
--UPDATE District_CitizenYieldChanges SET YieldChange=2 WHERE YieldType='YIELD_SCIENCE' 		AND DistrictType="DISTRICT_SEOWON";
--UPDATE District_CitizenYieldChanges SET YieldChange=2 WHERE YieldType='YIELD_CULTURE' 		AND DistrictType="DISTRICT_THEATER";

----Simulate specialists not requiring food.
--REPLACE INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange)
--SELECT DistrictType, 'YIELD_FOOD', 2
--FROM District_CitizenYieldChanges;

--Set other districts to cost more based on previous copies
UPDATE Districts
SET 
	CostProgressionModel = 'COST_PROGRESSION_PREVIOUS_COPIES',
	CostProgressionParam1 = ROUND(Cost/2, 0)
WHERE CostProgressionModel <> 'NO_COST_PROGRESSION';

--Tier 0 districts
UPDATE Districts SET Cost = '30' WHERE
  DistrictType = 'DISTRICT_AQUEDUCT';

--Tier 1 districts
UPDATE Districts SET Cost = '60' WHERE
  DistrictType = 'DISTRICT_CAMPUS' OR
  DistrictType = 'DISTRICT_ENCAMPMENT' OR
  DistrictType = 'DISTRICT_HOLY_SITE' OR
  DistrictType = 'DISTRICT_THEATER' OR
  DistrictType = 'DISTRICT_COMMERCIAL_HUB' OR
  DistrictType = 'DISTRICT_HARBOR';

--Tier 2 districts
UPDATE Districts SET Cost = '90' WHERE
  DistrictType = 'DISTRICT_ENTERTAINMENT_COMPLEX' OR
  DistrictType = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX' OR
  DistrictType = 'DISTRICT_INDUSTRIAL_ZONE' OR
  DistrictType = 'DISTRICT_NEIGHBORHOOD';

--Tier 3 districts
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
