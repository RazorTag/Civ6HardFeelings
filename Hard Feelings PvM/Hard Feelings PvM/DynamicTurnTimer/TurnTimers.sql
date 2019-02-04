-- TurnTimers
-- Author: Doomturtle
-- DateCreated: 2/2/2019 2:55:24 PM
--------------------------------------------------------------
UPDATE TurnSegments
SET TimeLimit_Base=30, TimeLimit_PerCity=5, TimeLimit_PerUnit=2
WHERE TurnSegmentType='TURNSEG_SINGLEPLAYER' OR TurnSegmentType='TURNSEG_SINGLEPHASE';

UPDATE TurnSegments
SET TimeLimit_Base=10, TimeLimit_PerCity=0, TimeLimit_PerUnit=2
WHERE TurnSegmentType='TURNSEG_TACTICAL';

UPDATE TurnSegments
SET TimeLimit_Base=20, TimeLimit_PerCity=5, TimeLimit_PerUnit=0
WHERE TurnSegmentType='TURNSEG_STRATEGIC';