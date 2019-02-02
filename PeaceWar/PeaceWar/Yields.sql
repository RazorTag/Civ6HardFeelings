-- Yields
-- Author: Doomturtle
-- DateCreated: 11/9/2017 1:46:07 PM
--------------------------------------------------------------
--Default: -0.5
UPDATE Yields SET OccupiedCityChange = '-0.75' WHERE YieldType = 'YIELD_PRODUCTION';

--Default: -0.75
UPDATE Yields SET OccupiedCityChange='-1.0' WHERE YieldType='YIELD_SCIENCE' OR YieldType='YIELD_CULTURE' OR YieldType='YIELD_FAITH' OR YieldType='YIELD_GOLD';