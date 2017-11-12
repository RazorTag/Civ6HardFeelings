-- Gameplay
-- Author: Evan Norsworthy
-- DateCreated: 10/26/2017 2:47:10 PM
--------------------------------------------------------------
--INSERT INTO Units
		--(UnitType, Name, BaseSightRange, BaseMoves, Combat, RangedCombat, Range, Bombard, Domain, FormationClass, Cost, PopulationCost, FoundCity, FoundReligion, MakeTradeRoute, EvangelizeBelief, LaunchInquisition, RequiresInquisition, BuildCharges, ReligiousStrength, ReligionEvictPercent, SpreadCharges, ExtractArtifacts, Description, Flavor, CanCapture, CanRetreatWhenCaptured, TraitType, AllowBarbarians, CostProgressionModel, CostProgressionParam1, PromotionClass, InitialLevel, NumRandomChoices, PrereqTech, PrereqCivic, PrereqDistrict, PrereqPopulation, LeaderType, CanTrain, StrategicResource, PurchaseYield, MustPurchase, Maintenance, Stackable, AirSlots, CanTargetAir, PseudoYieldType, ZoneOfControl, AntiAirCombat, Spy, WMDCapable, ParkCharges, IgnoreMoves, TeamVisibility, ObsoleteTech, ObsoleteCivic, MandatoryObsoleteTech, MandatoryObsoleteCivic, AdvisorType)
--SELECT	 UnitType, Name, BaseSightRange, BaseMoves, Combat, RangedCombat, Range, Bombard, Domain, FormationClass, Cost, PopulationCost, FoundCity, FoundReligion, MakeTradeRoute, EvangelizeBelief, LaunchInquisition, RequiresInquisition, BuildCharges, ReligiousStrength, ReligionEvictPercent, SpreadCharges, ExtractArtifacts, Description, Flavor, CanCapture, CanRetreatWhenCaptured, TraitType, AllowBarbarians, CostProgressionModel, CostProgressionParam1, PromotionClass, InitialLevel, NumRandomChoices, PrereqTech, PrereqCivic, PrereqDistrict, PrereqPopulation, LeaderType, CanTrain, StrategicResource, PurchaseYield, MustPurchase, Maintenance, Stackable, AirSlots, CanTargetAir, PseudoYieldType, ZoneOfControl, AntiAirCombat, Spy, WMDCapable, ParkCharges, IgnoreMoves, TeamVisibility, ObsoleteTech, ObsoleteCivic, MandatoryObsoleteTech, MandatoryObsoleteCivic, AdvisorType
--FROM Units WHERE UnitType = 'UNIT_GREAT_GENERAL';

--Make great generals and admirals capturable
--UPDATE Units SET CanRetreatWhenCaptured = '0' WHERE
	--UnitType = 'UNIT_GREAT_GENERAL' OR
	--UnitType = 'UNIT_GREAT_ADMIRAL' OR
	--UnitType = 'UNIT_GREAT_ENGINEER' OR
	--UnitType = 'UNIT_GREAT_MERCHANT' OR
	--UnitType = 'UNIT_GREAT_PROPHET' OR
	--UnitType = 'UNIT_GREAT_SCIENTIST' OR
	--UnitType = 'UNIT_GREAT_WRITER' OR
	--UnitType = 'UNIT_GREAT_ARTIST' OR
	--UnitType = 'UNIT_GREAT_MUSICIAN';

--Allow settlers and builders to retreat when captured like great people do in vanilla
UPDATE Units SET CanRetreatWhenCaptured = '1' WHERE
	UnitType = 'UNIT_SETTLER' OR
	UnitType = 'UNIT_BUILDER';

--Remove great general and great admiral combat and movement buffs
DELETE FROM GreatPersonIndividualBirthModifiers;	--AOE buffs
UPDATE GreatPersonIndividuals SET AreaHighlightRadius = NULL;	--highlighting for AOE buffs

--Set siege unit movement to 1
UPDATE Units SET BaseMoves = '1' WHERE
	UnitType = 'UNIT_BATTERING_RAM' OR
	UnitType = 'UNIT_SIEGE_TOWER';
	--UnitType = 'UNIT_CATAPULT' OR
	--UnitType = 'UNIT_BOMBARD' OR
	--UnitType = 'UNIT_ARTILLERY' OR
	--UnitType = 'UNIT_ROCKET_ARTILLERY';

--Increase cost of battering rams
UPDATE Units SET Cost = Cost*2 WHERE UnitType = 'UNIT_BATTERING_RAM';

--Increase cost of siege towers
UPDATE Units SET Cost = Cost*5 WHERE UnitType = 'UNIT_SIEGE_TOWER';
