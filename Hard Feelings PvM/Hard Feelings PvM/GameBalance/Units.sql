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