-- Units
-- Author: Evan Norsworthy
-- DateCreated: 10/27/2017 7:14:31 AM
--------------------------------------------------------------
--Rebalance individual units
--------------------------------------------------------------
--Default: 0 maintenance, 5 cost
UPDATE Units SET Maintenance = 1, Cost = 65 WHERE UnitType = 'UNIT_SUMERIAN_WAR_CART';

--Default: 25 combat, 65 cost
UPDATE Units SET Combat = 28, Cost = 50 WHERE UnitType = 'UNIT_SPEARMAN' OR UnitType = 'UNIT_GREEK_HOPLITE';

--Default: 80 cost
UPDATE Units SET Cost = 100 WHERE UnitType = 'UNIT_HORSEMAN';

--Buff the saka horse archer to make up for Scythia losing its double light cavalry (Default: 1 range, 15 combat, 25 ranged strength)
UPDATE Units SET Range = 2, Combat = 25, RangedCombat = 40 WHERE UnitType = 'UNIT_SCYTHIAN_HORSE_ARCHER';

--Default: 3 maintenance, 41 combat, 200 cost
UPDATE Units SET Maintenance = 2, Combat = 45, Cost = 150 WHERE UnitType = 'UNIT_PIKEMAN';

--Default: 45 combat samurai, 40 combat berserker
UPDATE Units SET Combat = Combat+5 WHERE UnitType = 'UNIT_JAPANESE_SAMURAI' OR UnitType = 'UNIT_NORWEGIAN_BERSERKER';

--Default: 3 maintenance
UPDATE Units SET Maintenance = 4 WHERE UnitType = 'UNIT_KNIGHT' OR UnitType = 'UNIT_ARABIAN_MAMLUK';

--Default: 5 maintenance
UPDATE Units SET Maintenance = 4 WHERE UnitType = 'UNIT_FRIGATE';

--Default: 400 cost
UPDATE Units SET Cost = 340 WHERE UnitType = 'UNIT_AT_CREW';

--Default: 6 maintenance, 65 combat, 75 ranged combat, 1 range
UPDATE Units SET Maintenance = 7, Combat = 70, RangedCombat = 80, Range = 2 WHERE UnitType = 'UNIT_MACHINE_GUN';

--Default: 82 combat
UPDATE Units SET Combat = 85 WHERE UnitType = 'UNIT_HELICOPTER';

--Default: 8 maintenance, 80 combat, 580 cost
UPDATE Units SET Maintenance = 6, Combat = 90, Cost = 530 WHERE UnitType = 'UNIT_MODERN_AT';

--Default: 95 bombard
UPDATE Units SET Bombard = 90 WHERE UnitType = 'UNIT_ROCKET_ARTILLERY';
