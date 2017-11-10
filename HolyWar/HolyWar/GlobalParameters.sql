-- GlobalParameters
-- Author: Evan Norsworthy
-- DateCreated: 11/4/2017 9:28:23 PM
--------------------------------------------------------------
--Enable unlocking of governments with faith
--UPDATE GlobalParameters SET Value = 'true' WHERE Name = 'GOVERNMENT_UNLOCK_WITH_FAITH';

--Faster natural spread for religion (default: 1)
UPDATE GlobalParameters SET Value = '10' WHERE Name = 'RELIGION_SPREAD_ADJACENT_PER_TURN_PRESSURE';

--Condemning religious units does not remove their religion from nearby cities
UPDATE GlobalParameters SET Value = '0' WHERE Name = 'RELIGION_SPREAD_UNIT_CAPTURE';
