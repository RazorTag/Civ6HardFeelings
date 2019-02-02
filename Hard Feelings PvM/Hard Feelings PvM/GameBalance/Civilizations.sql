-- Civilizations
-- Author: Doomturtle
-- DateCreated: 11/9/2017 12:32:31 PM
--------------------------------------------------------------
----Replace Scythia's double cavalry with Sumeria's Epic Quest
--Update CivilizationTraits SET TraitType = 'TRAIT_CIVILIZATION_FIRST_CIVILIZATION' WHERE CivilizationType = 'CIVILIZATION_SCYTHIA' AND TraitType = 'TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY';

--Replace Scythia's double cavalry with the ability to purchase cavalry units with faith
DELETE FROM TraitModifiers
	WHERE ModifierId='TRAIT_EXTRALIGHTCAVALRY' OR ModifierId='TRAIT_EXTRASAKAHORSEARCHER';
REPLACE INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY' , 'SCYTHIA_FAITH_PURCHASE_LCAVALRY_CPLMOD');
REPLACE INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY' , 'SCYTHIA_FAITH_PURCHASE_HCAVALRY_CPLMOD');
REPLACE INTO TraitModifiers (TraitType , ModifierId)
	VALUES ('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY' , 'SCYTHIA_FAITH_PURCHASE_RCAVALRY_CPLMOD');
REPLACE INTO Modifiers (ModifierId , ModifierType)
	VALUES ('SCYTHIA_FAITH_PURCHASE_LCAVALRY_CPLMOD' , 'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE');
REPLACE INTO Modifiers (ModifierId , ModifierType)
	VALUES ('SCYTHIA_FAITH_PURCHASE_HCAVALRY_CPLMOD' , 'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE');
REPLACE INTO Modifiers (ModifierId , ModifierType)
	VALUES ('SCYTHIA_FAITH_PURCHASE_RCAVALRY_CPLMOD' , 'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE');
REPLACE INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('SCYTHIA_FAITH_PURCHASE_LCAVALRY_CPLMOD' , 'Tag' , 'CLASS_LIGHT_CAVALRY');
REPLACE INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('SCYTHIA_FAITH_PURCHASE_HCAVALRY_CPLMOD' , 'Tag' , 'CLASS_HEAVY_CAVALRY');
REPLACE INTO ModifierArguments (ModifierId , Name , Value)
	VALUES ('SCYTHIA_FAITH_PURCHASE_RCAVALRY_CPLMOD' , 'Tag' , 'CLASS_RANGED_CAVALRY'); 

----Reduce Scythia's healing on unit kill
--Update ModifierArguments Set Value = '10' where ModifierId = 'HEAL_AFTER_DEFEATING_UNIT';
