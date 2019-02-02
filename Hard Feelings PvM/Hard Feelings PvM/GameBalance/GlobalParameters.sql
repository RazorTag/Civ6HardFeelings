-- GlobalParameters
-- Author: Doomturtle
-- DateCreated: 11/8/2017 6:01:34 PM


--Stop units from excessively healing when they level up
UPDATE GlobalParameters SET Value = 15 WHERE Name = 'EXPERIENCE_PROMOTE_HEALED';


----------------------------------------------------------------
----War Weariness
----------------------------------------------------------------
----Reduce war weariness decay for declaring peace (default: 2000)
--UPDATE GlobalParameters SET Value ='0' WHERE Name = 'WAR_WEARINESS_DECAY_PEACE_DECLARED';
--
----Make wartime war weariness decay the same as peacetime (default: 50)
--UPDATE GlobalParameters SET Value ='200' WHERE Name = 'WAR_WEARINESS_DECAY_TURN_AT_WAR';
--
----Make war weariness decay more slowly when at peace (default: 200)
--UPDATE GlobalParameters SET Value ='200' WHERE Name = 'WAR_WEARINESS_DECAY_TURN_AT_PEACE';

--No war weariness from combat in allied lands (default: 1)
UPDATE GlobalParameters SET Value = 0 WHERE Name = 'WAR_WEARINESS_PER_COMBAT_IN_ALLIED_LANDS';

----No war weariness from combat in foreign lands (default: 2)
----Raising this value doesn't seem to have any impact on war weariness. I would like to increase it if it did.
--UPDATE GlobalParameters SET Value = '0' WHERE Name = 'WAR_WEARINESS_PER_COMBAT_IN_FOREIGN_LANDS';
--
----No war weariness from losing units (default: 3)
--UPDATE GlobalParameters SET Value = '0' WHERE Name = 'WAR_WEARINESS_PER_UNIT_KILLED';
--
----Gain extra war weariness from launching nukes (default: 10)
--UPDATE GlobalParameters SET Value = '1000' WHERE Name = 'WAR_WEARINESS_PER_WMD_LAUNCHED';
--
----Lose amenities from war weariness (default: 400)
--UPDATE GlobalParameters SET Value = '400' WHERE Name = 'WAR_WEARINESS_POINTS_FOR_AMENITY_LOSS';
--
----Unknown trigger (default: 3)
--UPDATE GlobalParameters SET Value = '0' WHERE Name = 'WAR_WEARINESS_LOSS_OVER_REQ_AMENITIES_AT_WAR_CITY';
--
----Unknown trigger (default: 0)
--UPDATE GlobalParameters SET Value = '0' WHERE Name = 'WAR_WEARINESS_LOSS_OVER_REQ_AMENITIES_FOUNDED_CITY';
--
----Unknown trigger (default: 1)
--UPDATE GlobalParameters SET Value = '0' WHERE Name = 'WAR_WEARINESS_LOSS_OVER_REQ_AMENITIES_NONFOUNDED_CITY';
--
----Unknown trigger (default: 16)
--UPDATE GlobalParameters SET Value = '0' WHERE Name = 'WAR_WEARINESS_WARMONGER_BASE';
