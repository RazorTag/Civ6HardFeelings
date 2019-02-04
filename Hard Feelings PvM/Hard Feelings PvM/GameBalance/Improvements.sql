-- Improvements
-- Author: Doomturtle
-- DateCreated: 9/17/2018 8:56:25 PM
--------------------------------------------------------------

--------------------------------------------------------------
--Restructure farm yield adjacency bonuses
--------------------------------------------------------------
----Minor adjacency bonus to production for farms with Craftsmanship
--INSERT INTO Adjacency_YieldChanges
				--(ID,																Description, YieldType,						YieldChange,	TilesRequired,	AdjacentImprovement, PrereqCivic,						ObsoleteCivic,	AdjacentResourceClass)
--SELECT	'Farms_AncientProductionAdjacency',	Description, 'YIELD_PRODUCTION',	1,						2,							AdjacentImprovement, 'CIVIC_CRAFTSMANSHIP',	'CIVIC_GUILDS',	AdjacentResourceClass
--FROM Adjacency_YieldChanges WHERE ID='Farms_MedievalAdjacency';
--
--UPDATE Civics SET Description='LOC_CIVIC_CRAFTSMANSHIP_DESCRIPTION' WHERE CivicType='CIVIC_CRAFTSMANSHIP';
--
--INSERT INTO Improvement_Adjacencies
	--(ImprovementType, YieldChangeId)
--VALUES('IMPROVEMENT_FARM', 'Farms_AncientProductionAdjacency');
--
----Major adjacency bonus to production for farms with Guilds
--INSERT INTO Adjacency_YieldChanges
				--(ID,																	Description, YieldType,						YieldChange,	TilesRequired,	AdjacentImprovement, PrereqCivic,			AdjacentResourceClass)
--SELECT	'Farms_MedievalProductionAdjacency',	Description, 'YIELD_PRODUCTION',	1,						1,							AdjacentImprovement, 'CIVIC_GUILDS',	AdjacentResourceClass
--FROM Adjacency_YieldChanges WHERE ID='Farms_MedievalAdjacency';
--
--UPDATE Civics SET Description='LOC_CIVIC_GUILDS_DESCRIPTION' WHERE CivicType='CIVIC_GUILDS';
--
--INSERT INTO Improvement_Adjacencies
	--(ImprovementType, YieldChangeId)
--VALUES('IMPROVEMENT_FARM', 'Farms_MedievalProductionAdjacency');


--Activate the medeival farm adjacency bonus with craftsmanship (minor adjacency bonus)
INSERT INTO Adjacency_YieldChanges
		(ID,						Description, YieldType, YieldChange, TilesRequired, AdjacentImprovement, PrereqCivic,			ObsoleteCivic,		AdjacentResourceClass)
SELECT   'Farms_AncientAdjacency',	Description, YieldType, YieldChange, TilesRequired, AdjacentImprovement, 'CIVIC_CRAFTSMANSHIP',	'CIVIC_FEUDALISM',	AdjacentResourceClass
FROM Adjacency_YieldChanges WHERE ID='Farms_MedievalAdjacency';

UPDATE Civics SET Description='LOC_CIVIC_CRAFTSMANSHIP_DESCRIPTION' WHERE CivicType='CIVIC_CRAFTSMANSHIP';

INSERT INTO Improvement_Adjacencies
	(ImprovementType, YieldChangeId)
VALUES('IMPROVEMENT_FARM', 'Farms_AncientAdjacency');

--Decrease farm adjacency requirement of medeival farms from 2 to 1 (major adjacency bonus)
UPDATE Adjacency_YieldChanges
SET TilesRequired=1
WHERE ID='Farms_MedievalAdjacency';

--Increase adjacency bonus of modern farms from 1 to 2 (super adjacency bonus)
UPDATE Adjacency_YieldChanges
SET YieldChange=2
WHERE ID='Farms_MechanizedAdjacency';