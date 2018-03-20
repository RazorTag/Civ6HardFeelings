-- Resources
-- Author: enors
-- DateCreated: 12/9/2017 3:49:27 AM
--------------------------------------------------------------
--Make crabs a luxury resource
UPDATE Resources SET Happiness = '4', ResourceClassType='RESOURCECLASS_LUXURY' WHERE ResourceType = 'RESOURCE_CRABS';