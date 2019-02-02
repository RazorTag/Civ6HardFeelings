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