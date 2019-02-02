-- Units
-- Author: Doomturtle
-- DateCreated: 8/24/2018 7:32:33 PM
--------------------------------------------------------------
--Give every unit effectively infinite view range.
UPDATE Units SET BaseSightRange=110;
--UPDATE Units SET BaseSightRange=2*BaseSightRange;

--Let units see through hills and mountains.
UPDATE Terrains SET SightThroughModifier=0;

--Let units see through woods and rainforest.
UPDATE Features SET SightThroughModifier=0;