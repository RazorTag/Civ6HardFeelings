-- StartingUnits
-- Author: Doomturtle
-- DateCreated: 7/26/2018 2:22:49 AM
--------------------------------------------------------------

-- Remove all free AI starting units.
DELETE FROM MajorStartingUnits WHERE AiOnly=1;