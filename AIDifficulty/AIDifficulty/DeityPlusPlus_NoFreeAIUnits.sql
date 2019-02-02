-- AI STARTING BONUSES AND DIFFICULTY LEVEL SCALING


-- Default free AI starting units in Eras.xml (lines 36-108), in addition to what the human player gets:
--
-- Settlers:     +1 settler at Emperor and Immortal, +2 settlers at Deity and Deity+, and +3 settlers at Deity++.
-- Combat units: +1 unit at King, +2 units at Emperor, +3 units at Immortal, +4 units at Deity,
--               +5 units at Deity+, and +6 units at Deity++.
-- Builders:     +1 builder at King and Emperor, +2 builders at Immortal and Deity, and +3 builders at Deity+ and Deity++.
--
-- NOTES: Combat units are appropriate to the starting Era (warriors in the Ancient Era, spearmen in Classical, etc.
--        Free builders will spawn when a new city is settled.


-- Remove all free AI starting units.
DELETE FROM MajorStartingUnits WHERE AiOnly=1;



-- Default AI difficulty bonuses in Leaders.xml, lines 3333-3453:
--
-- Extra=8 means +8% per difficulty level above *Warlord*. So for example Deity gets +40% and Deity++ gets +56%.
-- Extra=20 means +20% per difficulty level above *Warlord*. So for example Deity gets +100% and Deity++ should
-- get +140%. But it doesn't, because all bonuses have hard-coded limits so that they can never exceed +100%.

-- HIGH_DIFFICULTY_SCIENCE_SCALING      Extra=8
-- HIGH_DIFFICULTY_CULTURE_SCALING      Extra=8
-- HIGH_DIFFICULTY_FAITH_SCALING        Extra=8
-- HIGH_DIFFICULTY_PRODUCTION_SCALING   Extra=20
-- HIGH_DIFFICULTY_GOLD_SCALING         Extra=20

-- HIGH_DIFFICULTY_COMBAT_SCALING       Extra=1    (+1 combat strength to AI units per difficulty level above *Prince*)
-- HIGH_DIFFICULTY_FREE_TECH_BOOSTS     Extra=1    (+1 free random Eureka to AI civs per difficulty level above *Warlord*)
-- HIGH_DIFFICULTY_FREE_CIVIC_BOOSTS    Extra=1    (+1 free random Inspiration to AI civs per difficulty level above *Warlord*)
-- HIGH_DIFFICULTY_UNIT_XP_SCALING      Extra=10   (+10 combat XP to AI units per difficulty level above *Warlord*)
-- BARBARIAN_CAMP_GOLD_SCALING          Extra=-5   (-5 gold reward to the human player per difficulty level above *Prince*)


-- To compensate for the lack of free starting units and provide an even progression of AI bonuses throughout the game,
-- double the default bonuses to science and culture. Faith is left at default since the AI tends to aggressively
-- go for faith anyway. The boosts to science and culture will be: Deity +80%, Deity+ +96%, and Deity++ +100% (only 100%
-- because of the cap).
UPDATE ModifierArguments SET Extra=16 WHERE Name='Amount' AND (
	ModifierID='HIGH_DIFFICULTY_SCIENCE_SCALING' OR
	ModifierID='HIGH_DIFFICULTY_CULTURE_SCALING'	);

-- Increase default bonuses to production and gold from 20% per level to 25% per level. The boosts will cap at 100%
-- already at Immortal, but we will compensate by nerfing human production and gold above Deity.
UPDATE ModifierArguments SET Extra=25 WHERE Name='Amount' AND (
	ModifierID='HIGH_DIFFICULTY_PRODUCTION_SCALING' OR
	ModifierID='HIGH_DIFFICULTY_GOLD_SCALING'	);

-- Keep default bonuses for other modifiers.
-- (The UPDATE statement does nothing, but is included here for clarity.)
UPDATE ModifierArguments SET Extra=Extra WHERE Name='Amount' AND (
	ModifierID='HIGH_DIFFICULTY_FAITH_SCALING' OR
	ModifierID='HIGH_DIFFICULTY_COMBAT_SCALING' OR
	ModifierID='HIGH_DIFFICULTY_FREE_TECH_BOOSTS' OR
	ModifierID='HIGH_DIFFICULTY_FREE_CIVIC_BOOSTS' OR
	ModifierID='HIGH_DIFFICULTY_UNIT_XP_SCALING' OR
	ModifierID='BARBARIAN_CAMP_GOLD_SCALING' 	);

-- Nerf human science and culture by 6% at Deity+ and 12% at Deity++, to compensate for the AI science/culture boost
-- that was capped at +100% but should have been +112% at Deity++.
UPDATE ModifierArguments SET Extra=-6 WHERE Name='Amount' AND (
	ModifierID='TRAIT_NERF_HUMAN_SCIENCE' OR
	ModifierID='TRAIT_NERF_HUMAN_CULTURE'	);

-- Nerf human production and gold by 8% at Deity, 16% at Deity+ and 24% at Deity++, to partially compensate for
-- the AI production boost that was capped at +100% but should have been +125% at Deity, +150% at Deity+ and
-- 175% at Deity++. We'll only nerf by 8% per level because 25% per level feels WAY too slow.
UPDATE ModifierArguments SET Value=-8, Extra=-8 WHERE Name='Amount' AND (
	ModifierID='TRAIT_NERF_HUMAN_PRODUCTION' OR
	ModifierID='TRAIT_NERF_HUMAN_GOLD'	);