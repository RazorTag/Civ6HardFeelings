-- YieldScaling
-- Author: Doomturtle
-- DateCreated: 7/26/2018 3:24:23 AM
--------------------------------------------------------------

--------------------------------------------------------------
-- AI bonuses at high difficulties
--------------------------------------------------------------
-- Create food yield scaling for high difficulty AIs. Do not set values here.
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId) VALUES
	('TRAIT_LEADER_MAJOR_CIV', 'HIGH_DIFFICULTY_FOOD_SCALING');
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES
	('HIGH_DIFFICULTY_FOOD_SCALING', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 'PLAYER_IS_HIGH_DIFFICULTY_AI');
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Type, Value, Extra, SecondExtra) VALUES
	('HIGH_DIFFICULTY_FOOD_SCALING', 'Amount', 'LinearScaleFromDefaultHandicap', 0, 0, 'DIFFICULTY_PRINCE');
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Type, Value) VALUES
	('HIGH_DIFFICULTY_FOOD_SCALING', 'YieldType', 'ARGTYPE_IDENTITY', 'YIELD_FOOD');

-- Apply yield scaling to city states
--INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId) VALUES ('MINOR_CIV_DEFAULT_TRAIT', 'HIGH_DIFFICULTY_FOOD_SCALING');
--INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId) VALUES ('MINOR_CIV_DEFAULT_TRAIT', 'HIGH_DIFFICULTY_PRODUCTION_SCALING');

-- Remove AI difficulty scaling from combat strength, combat xp, culture, faith, science. Remove free tech and civic boosts.
UPDATE ModifierArguments SET Value=0 WHERE ModifierId='HIGH_DIFFICULTY_COMBAT_SCALING' AND Name='Amount';
UPDATE ModifierArguments SET Extra=0 WHERE Name='Amount' AND
	(
		ModifierId='HIGH_DIFFICULTY_COMBAT_SCALING' OR
		ModifierId='HIGH_DIFFICULTY_UNIT_XP_SCALING' OR
		ModifierId='HIGH_DIFFICULTY_CULTURE_SCALING' OR
		ModifierId='HIGH_DIFFICULTY_FAITH_SCALING' OR
		ModifierId='HIGH_DIFFICULTY_SCIENCE_SCALING' OR
		ModifierId='HIGH_DIFFICULTY_FREE_CIVIC_BOOSTS' OR
		ModifierId='HIGH_DIFFICULTY_FREE_TECH_BOOSTS'
	);

-- Modify AI difficulty scaling for gold, production, and food.
UPDATE ModifierArguments SET Extra=25 WHERE Name='Amount' AND
	(
		ModifierId='HIGH_DIFFICULTY_GOLD_SCALING' OR
		ModifierId='HIGH_DIFFICULTY_PRODUCTION_SCALING' OR
		ModifierId='HIGH_DIFFICULTY_FOOD_SCALING'
	);


--------------------------------------------------------------
-- Player bonuses at low difficulties
--------------------------------------------------------------
-- Fix the bug where warlord is not considered low difficulty. Value is normally set to DIFFICULTY_WARLORD which prevents Warlord difficulty from being considered low difficulty.
UPDATE RequirementArguments SET Value='DIFFICULTY_PRINCE' WHERE RequirementId='REQUIRES_LOW_DIFFICULTY';

-- Create gold, production, and food yield scaling for low difficulty players. Do not set values here.
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId) VALUES
	('TRAIT_LEADER_MAJOR_CIV', 'LOW_DIFFICULTY_GOLD_SCALING'),
	('TRAIT_LEADER_MAJOR_CIV', 'LOW_DIFFICULTY_PRODUCTION_SCALING'),
	('TRAIT_LEADER_MAJOR_CIV', 'LOW_DIFFICULTY_FOOD_SCALING');
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES
	('LOW_DIFFICULTY_GOLD_SCALING', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 'PLAYER_IS_HUMAN'),
	('LOW_DIFFICULTY_PRODUCTION_SCALING', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 'PLAYER_IS_HUMAN'),
	('LOW_DIFFICULTY_FOOD_SCALING', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 'PLAYER_IS_HUMAN');
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Type, Value, Extra, SecondExtra) VALUES
	('LOW_DIFFICULTY_GOLD_SCALING', 'Amount', 'LinearScaleFromDefaultHandicap', 0, 0, 'DIFFICULTY_PRINCE'),
	('LOW_DIFFICULTY_PRODUCTION_SCALING', 'Amount', 'LinearScaleFromDefaultHandicap', 0, 0, 'DIFFICULTY_PRINCE'),
	('LOW_DIFFICULTY_FOOD_SCALING', 'Amount', 'LinearScaleFromDefaultHandicap', 0, 0, 'DIFFICULTY_PRINCE');
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Type, Value) VALUES
	('LOW_DIFFICULTY_GOLD_SCALING', 'YieldType', 'ARGTYPE_IDENTITY', 'YIELD_GOLD'),
	('LOW_DIFFICULTY_PRODUCTION_SCALING', 'YieldType', 'ARGTYPE_IDENTITY', 'YIELD_PRODUCTION'),
	('LOW_DIFFICULTY_FOOD_SCALING', 'YieldType', 'ARGTYPE_IDENTITY', 'YIELD_FOOD');

-- Remove player difficulty scaling from combat strength, combat xp, culture, faith, science. Remove free tech and civic boosts.
UPDATE ModifierArguments SET Extra=0 WHERE Name='Amount' AND
	(
		ModifierId='LOW_DIFFICULTY_COMBAT_SCALING' OR
		ModifierId='LOW_DIFFICULTY_UNIT_XP_SCALING'
	);

-- Modify player difficulty scaling for gold, production, and food.
UPDATE ModifierArguments SET Extra=-10 WHERE Name='Amount' AND
	(
		--ModifierId='LOW_DIFFICULTY_GOLD_SCALING' OR
		ModifierId='LOW_DIFFICULTY_PRODUCTION_SCALING'-- OR
		--ModifierId='LOW_DIFFICULTY_FOOD_SCALING'
	);