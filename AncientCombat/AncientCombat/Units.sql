-- Units
-- Author: Doomturtle
-- DateCreated: 8/18/2018 5:27:05 PM
--------------------------------------------------------------

--------------------------------------------------------------
--Nerfs for combat units to keep
--------------------------------------------------------------
----Nerf war-carts and make them replace the heavy chariot
--UPDATE Units
--SET
	--Cost = 15 + (SELECT Cost FROM Units WHERE UnitType = 'UNIT_HEAVY_CHARIOT'),
	--PrereqTech = (SELECT PrereqTech FROM Units WHERE UnitType = 'UNIT_HEAVY_CHARIOT'),
	--TraitType = NULL
--WHERE UnitType = 'UNIT_SUMERIAN_WAR_CART';
--DELETE FROM UnitReplaces WHERE CivUniqueUnitType = 'UNIT_SUMERIAN_WAR_CART' AND ReplacesUnitType = 'UNIT_HEAVY_CHARIOT';
--INSERT INTO UnitReplaces VALUES ('UNIT_SUMERIAN_WAR_CART', 'UNIT_HEAVY_CHARIOT');
--
----Nerf pitati archers
--UPDATE Units
--SET Cost = 15 + (SELECT Cost FROM Units WHERE UnitType = 'UNIT_ARCHER')
--WHERE UnitType = 'UNIT_NUBIAN_PITATI';
--
----Nerf Norweigian longship
--UPDATE Units
--SET Cost = 15 + (SELECT Cost FROM Units WHERE UnitType = 'UNIT_GALLEY')
--WHERE UnitType = 'UNIT_NORWEGIAN_LONGSHIP';
--
----Nerf the Cree Okihtcitaw
--UPDATE Units
--SET
	--Cost = (SELECT Cost FROM Units WHERE UnitType = 'UNIT_SCOUT'),
	--Combat = (SELECT Combat FROM Units WHERE UnitType = 'UNIT_SCOUT')
--WHERE UnitType = 'UNIT_CREE_OKIHTCITAW';
--
----Nerf the Maryannu chariot archer
--UPDATE Units
--SET Cost = 150
--WHERE UnitType = 'UNIT_EGYPTIAN_CHARIOT_ARCHER';

----Give the eagle warrior a maintenance cost.
--UPDATE Units SET Maintenance = 1 WHERE UnitType = 'UNIT_AZTEC_EAGLE_WARRIOR';

--Nerf warrior monks
UPDATE Units SET Combat = 24 WHERE UnitType = 'UNIT_WARRIOR_MONK';
UPDATE ModifierArguments SET Value = 4 WHERE ModifierId = 'EXPLODING_PALMS_INCREASED_COMBAT_STRENGTH';
UPDATE ModifierArguments SET Value = 4 WHERE ModifierId = 'COBRA_STRIKE_INCREASED_COMBAT_STRENGTH';

----Nerf catapult from the Classical era into the Ancient era
--UPDATE Units SET Combat = 15, Bombard = 25 WHERE UnitType = 'UNIT_CATAPULT';


--------------------------------------------------------------
--Remove units
--------------------------------------------------------------
--Make units that are too advanced unlockable by future tech/civic
UPDATE Units
SET PrereqTech = 'TECH_FUTURE_TECH', PrereqCivic = 'CIVIC_FUTURE_CIVIC'
WHERE
--Remove units that are too strong.
(
	Combat > 28 OR
	RangedCombat > 25 OR
	Bombard > 35
) OR
--Remove specific units that we don't want.
(
	UnitType = 'UNIT_BATTERING_RAM' OR
	UnitType = 'UNIT_SIEGE_TOWER' OR
	UnitType = 'UNIT_ANTIAIR_GUN' OR
	UnitType = 'UNIT_MOBILE_SAM' OR
	UnitType = 'UNIT_MILITARY_ENGINEER' OR
	UnitType = 'UNIT_PERSIAN_IMMORTAL'
) OR
--Remove unique units.
(
	TraitType LIKE 'TRAIT_LEADER_UNIT%' OR
	TraitType LIKE 'TRAIT_CIVILIZATION_UNIT%'
);

--Restore standard units for civs that replaced standard units with unique units
DELETE FROM UnitReplaces;

----Allow settlers and builders to retreat instead of being captured the same way great people do.
--UPDATE Units SET CanRetreatWhenCaptured = '1' WHERE UnitType = 'UNIT_SETTLER';

----Change cost progression model for combat units from constant to scaling with number of previous copies.
--UPDATE Units
--SET
	--CostProgressionModel = 'COST_PROGRESSION_PREVIOUS_COPIES',
	--CostProgressionParam1 = ROUND(0.05 * Cost, 0)
--WHERE
--CostProgressionModel <> 'COST_PROGRESSION_PREVIOUS_COPIES' AND
--(
	--FormationClass = 'FORMATION_CLASS_LAND_COMBAT' OR
	--FormationClass = 'FORMATION_CLASS_NAVAL' OR
	--FormationClass = 'FORMATION_CLASS_AIR' OR
	--FormationClass = 'FORMATION_CLASS_SUPPORT'
--);
