-- Terrain_YieldChanges
-- Author: Doomturtle
-- DateCreated: 8/25/2018 1:46:24 PM
--------------------------------------------------------------

--Adds global yields to water, desert, and winter tile types.
INSERT INTO Terrain_YieldChanges (TerrainType, YieldType, YieldChange)
VALUES
('TERRAIN_OCEAN', 'YIELD_SCIENCE', 1),
('TERRAIN_DESERT', 'YIELD_CULTURE', 1),
('TERRAIN_DESERT', 'YIELD_GOLD', 1),
('TERRAIN_DESERT_HILLS', 'YIELD_CULTURE', 1),
('TERRAIN_DESERT_HILLS', 'YIELD_GOLD', 1),
('TERRAIN_TUNDRA', 'YIELD_GOLD', 1),
('TERRAIN_TUNDRA_HILLS', 'YIELD_GOLD', 1),
('TERRAIN_SNOW', 'YIELD_SCIENCE', 1),
('TERRAIN_SNOW_HILLS', 'YIELD_SCIENCE', 1);