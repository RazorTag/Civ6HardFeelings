-- Civilizations
-- Author: enors
-- DateCreated: 11/9/2017 12:32:31 PM
--------------------------------------------------------------
--Replace Scythia's double cavalry with Sumeria's Epic Quest
Update CivilizationTraits SET TraitType = 'TRAIT_CIVILIZATION_FIRST_CIVILIZATION' WHERE CivilizationType = 'CIVILIZATION_SCYTHIA' AND TraitType = 'TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY';

--Reduce Scythia's healing on unit kill
Update ModifierArguments Set Value = '15' where ModifierId = 'HEAL_AFTER_DEFEATING_UNIT';
