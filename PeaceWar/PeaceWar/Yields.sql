-- Yields
-- Author: enors
-- DateCreated: 11/9/2017 1:46:07 PM
--------------------------------------------------------------
UPDATE Yields SET OccupiedCityChange = '-0.75' WHERE YieldType = 'YIELD_PRODUCTION';
UPDATE Yields SET OccupiedCityChange = '-1' WHERE YieldType = 'YIELD_SCIENCE' OR YieldType = 'YIELD_CULTURE' OR YieldType = 'YIELD_FAITH';
