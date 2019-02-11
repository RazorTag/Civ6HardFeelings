-- Yields
-- Author: Doomturtle
-- DateCreated: 2/4/2019 2:44:27 PM
--------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers
			(ModifierId,									ModifierType)
VALUES('PRODUCTION_PER_POPULATION', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER'),
			('PRODUCTION_PER_POPULATION_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION'),
			('PRODUCTION_PER_POPULATION_10', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER'),
			('PRODUCTION_PER_POPULATION_20', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER');

INSERT OR REPLACE INTO Modifiers
			(ModifierId,															ModifierType,																							 SubjectRequirementSetId)
VALUES('PRODUCTION_PER_POPULATION_10_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION', 'STADIUM_10_POPULATION_REQUIREMENTS'),
			('PRODUCTION_PER_POPULATION_20_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION', 'STADIUM_20_POPULATION_REQUIREMENTS');

--------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments
			(ModifierId,									Name,					Type,								Value)
VALUES('PRODUCTION_PER_POPULATION', 'ModifierId', 'ARGTYPE_IDENTITY', 'PRODUCTION_PER_POPULATION_MODIFIER'),
			('PRODUCTION_PER_POPULATION_10', 'ModifierId', 'ARGTYPE_IDENTITY', 'PRODUCTION_PER_POPULATION_10_MODIFIER'),
			('PRODUCTION_PER_POPULATION_20', 'ModifierId', 'ARGTYPE_IDENTITY', 'PRODUCTION_PER_POPULATION_20_MODIFIER');

INSERT OR REPLACE INTO ModifierArguments
			(ModifierId,														Name,			Type,								Value)
VALUES('PRODUCTION_PER_POPULATION_MODIFIER', 'Amount', 'ARGTYPE_IDENTITY', '0.5'),
			('PRODUCTION_PER_POPULATION_MODIFIER', 'YieldType', 'ARGTYPE_IDENTITY', 'YIELD_PRODUCTION'),
			('PRODUCTION_PER_POPULATION_10_MODIFIER', 'Amount', 'ARGTYPE_IDENTITY', '0.5'),
			('PRODUCTION_PER_POPULATION_10_MODIFIER', 'YieldType', 'ARGTYPE_IDENTITY', 'YIELD_PRODUCTION'),
			('PRODUCTION_PER_POPULATION_20_MODIFIER', 'Amount', 'ARGTYPE_IDENTITY', '0.5'),
			('PRODUCTION_PER_POPULATION_20_MODIFIER', 'YieldType', 'ARGTYPE_IDENTITY', 'YIELD_PRODUCTION');

--------------------------------------------------------------------------------------------------------------------------
-- GameModifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO GameModifiers
			(ModifierId)
VALUES('PRODUCTION_PER_POPULATION'),
			('PRODUCTION_PER_POPULATION_10'),
			('PRODUCTION_PER_POPULATION_20');

------------------------------------------------------------------------------------------------------------------------------
------ Requirements
------------------------------------------------------------------------------------------------------------------------------
--INSERT OR REPLACE INTO Requirements
			--(RequirementId,											RequirementType)
--VALUES('REQUIRES_CITY_HAS_10_POPULATION', 'REQUIRES_CITY_HAS_X_POPULATION'),
			--('REQUIRES_CITY_HAS_20_POPULATION', 'REQUIRES_CITY_HAS_X_POPULATION'),
			--('REQUIRES_CITY_HAS_25_POPULATION', 'REQUIRES_CITY_HAS_X_POPULATION'),
			--('REQUIRES_CITY_HAS_30_POPULATION', 'REQUIRES_CITY_HAS_X_POPULATION');
----
------------------------------------------------------------------------------------------------------------------------------
------ RequirementArguments
------------------------------------------------------------------------------------------------------------------------------
----This check only works for 10 and 20 pop. I think it was only set up for 10 and 20 to support stadium tourism bonuses.
--INSERT OR REPLACE INTO RequirementArguments
			--(RequirementId,											Name,			Type,								Value)
--VALUES('REQUIRES_CITY_HAS_10_POPULATION', 'Amount', 'ARGTYPE_IDENTITY', '10'),
			--('REQUIRES_CITY_HAS_20_POPULATION', 'Amount', 'ARGTYPE_IDENTITY', '20'),
			--('REQUIRES_CITY_HAS_25_POPULATION', 'Amount', 'ARGTYPE_IDENTITY', '25'),
			--('REQUIRES_CITY_HAS_30_POPULATION', 'Amount', 'ARGTYPE_IDENTITY', '30');
----
------------------------------------------------------------------------------------------------------------------------------
------ RequirementSets
------------------------------------------------------------------------------------------------------------------------------
--INSERT OR REPLACE INTO RequirementSets
			--(RequirementSetId,				RequirementSetType)
--VALUES('CITY_HAS_10_POPULATION', 'REQUIREMENTSET_TEST_ALL'),
			--('CITY_HAS_20_POPULATION', 'REQUIREMENTSET_TEST_ALL'),
			--('CITY_HAS_25_POPULATION', 'REQUIREMENTSET_TEST_ALL'),
			--('CITY_HAS_30_POPULATION', 'REQUIREMENTSET_TEST_ALL');
----
------------------------------------------------------------------------------------------------------------------------------
------ RequirementSetRequirements
------------------------------------------------------------------------------------------------------------------------------
--INSERT OR REPLACE INTO RequirementSetRequirements
			--(RequirementSetId,				RequirementId)
--VALUES('CITY_HAS_10_POPULATION', 'REQUIRES_CITY_HAS_10_POPULATION'),
			--('CITY_HAS_20_POPULATION', 'REQUIRES_CITY_HAS_20_POPULATION'),
			--('CITY_HAS_25_POPULATION', 'REQUIRES_CITY_HAS_25_POPULATION'),
			--('CITY_HAS_30_POPULATION', 'REQUIRES_CITY_HAS_30_POPULATION');
