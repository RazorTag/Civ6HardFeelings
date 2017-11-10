-- Civilizations
-- Author: enors
-- DateCreated: 11/9/2017 12:32:31 PM
--------------------------------------------------------------
--Remove Scythia's heal after combat victory
Update ModifierArguments Set Value = '0' where ModifierId = 'HEAL_AFTER_DEFEATING_UNIT';
