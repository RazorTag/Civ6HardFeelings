-- Happinesses
-- Author: Doomturtle
-- DateCreated: 11/8/2017 9:24:13 PM
--------------------------------------------------------------

--No spontaneous rebellions at any unhappiness level
UPDATE Happinesses
SET RebellionPoints = -1;


--
UPDATE GlobalParameters
SET Value=3
WHERE Name='CITY_POP_PER_AMENITY';

UPDATE GlobalParameters
SET Value=0
WHERE Name='CITY_AMENITIES_FOR_FREE';
