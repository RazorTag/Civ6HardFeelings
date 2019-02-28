-- GameSpeeds_RiseAndFall
-- Author: Doomturtle
-- DateCreated: 9/14/2018 4:41:38 AM
--------------------------------------------------------------
--Controls the durations of things like trade routes and spy missions.
--------------------------------------------------------------

--DefaultCostMultiplier is scaled to maintain proportionality with the online game speed.
INSERT OR REPLACE INTO GameSpeed_Scalings
(GameSpeedScalingType, GameSpeedType, ScalingType, DefaultCostMultiplier)
VALUES
('FAST_HALF', 'GAMESPEED_FAST', 'SCALING_HALF', 53),
('CASUAL_HALF', 'GAMESPEED_CASUAL', 'SCALING_HALF', 40),
('BLAZING_HALF', 'GAMESPEED_BLAZING', 'SCALING_HALF', 26),
('ADHD_HALF', 'GAMESPEED_ADHD', 'SCALING_HALF', 13);


--These are rough guesstimates without rigourous math to back them.
INSERT OR REPLACE INTO GameSpeed_Durations
(GameSpeedScalingType, NumberofTurnsOnStandard, NumberOfTurnsScaled)
VALUES
('FAST_HALF', 5, 5),
('FAST_HALF', 10, 7),
('FAST_HALF', 15, 8),
('FAST_HALF', 30, 16),
('FAST_HALF', 60, 30),
('CASUAL_HALF', 5, 5),
('CASUAL_HALF', 10, 6),
('CASUAL_HALF', 15, 7),
('CASUAL_HALF', 30, 12),
('CASUAL_HALF', 60, 20),
('BLAZING_HALF', 5, 5),
('BLAZING_HALF', 10, 5),
('BLAZING_HALF', 15, 6),
('BLAZING_HALF', 30, 8),
('BLAZING_HALF', 60, 10),
('ADHD_HALF', 5, 5),
('ADHD_HALF', 10, 5),
('ADHD_HALF', 15, 5),
('ADHD_HALF', 30, 5),
('ADHD_HALF', 60, 5);