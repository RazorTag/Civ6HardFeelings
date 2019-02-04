-- Units
-- Author: Doomturtle
-- DateCreated: 10/27/2017 7:14:31 AM

--------------------------------------------------------------
--Rebalance individual units
--------------------------------------------------------------
--Default: Do not allow war-carts to be built from the start of the game.
UPDATE Units
SET PrereqTech=(SELECT PrereqTech FROM Units WHERE UnitType='UNIT_HEAVY_CHARIOT'),
		Maintenance=(SELECT Maintenance FROM Units WHERE UnitType='UNIT_HEAVY_CHARIOT')
WHERE UnitType = 'UNIT_SUMERIAN_WAR_CART';

--Move battering ram and siege tower to future tech
UPDATE Units
SET PrereqTech='TECH_FUTURE_TECH'
WHERE UnitType='UNIT_BATTERING_RAM' OR
			UnitType='UNIT_SIEGE_TOWER';

----Remove battering ram and siege tower from the game
--DELETE FROM Types WHERE Type='UNIT_BATTERING_RAM';
--DELETE FROM TypeTags WHERE Type='UNIT_BATTERING_RAM';
--DELETE FROM Units WHERE UnitType='UNIT_BATTERING_RAM';
--DELETE FROM Unit_BuildingPrereqs WHERE Unit='UNIT_BATTERING_RAM';
--DELETE FROM UnitUpgrades WHERE Unit='UNIT_BATTERING_RAM';
--DELETE FROM UnitAiInfos WHERE UnitType='UNIT_BATTERING_RAM';
--
--DELETE FROM Types WHERE Type='UNIT_SIEGE_TOWER';
--DELETE FROM TypeTags WHERE Type='UNIT_SIEGE_TOWER';
--DELETE FROM Units WHERE UnitType='UNIT_SIEGE_TOWER';
--DELETE FROM Unit_BuildingPrereqs WHERE Unit='UNIT_SIEGE_TOWER';
--DELETE FROM UnitUpgrades WHERE Unit='UNIT_SIEGE_TOWER';
--DELETE FROM UnitAiInfos WHERE UnitType='UNIT_SIEGE_TOWER';


--Give the palace inherent walls
UPDATE Buildings
SET OuterDefenseHitpoints = '50'
WHERE BuildingType = 'BUILDING_PALACE';


--Units consume pop to produce
UPDATE Units
SET PopulationCost=1, PrereqPopulation=2
WHERE
	PromotionClass='PROMOTION_CLASS_AIR_BOMBER' OR
	PromotionClass='PROMOTION_CLASS_AIR_FIGHTER' OR
	PromotionClass='PROMOTION_CLASS_ANTI_CAVALRY' OR
	PromotionClass='PROMOTION_CLASS_HEAVY_CAVALRY' OR
	PromotionClass='PROMOTION_CLASS_LIGHT_CAVALRY' OR
	PromotionClass='PROMOTION_CLASS_MELEE' OR
	PromotionClass='PROMOTION_CLASS_NAVAL_CARRIER' OR
	PromotionClass='PROMOTION_CLASS_NAVAL_MELEE' OR
	PromotionClass='PROMOTION_CLASS_NAVAL_RAIDER' OR
	PromotionClass='PROMOTION_CLASS_NAVAL_RANGED' OR
	PromotionClass='PROMOTION_CLASS_RANGED' OR
	PromotionClass='PROMOTION_CLASS_SIEGE';


--Captured settlers become builders
UPDATE UnitCaptures
SET BecomesUnitType='UNIT_BUILDER'
WHERE CapturedUnitType='UNIT_SETTLER';