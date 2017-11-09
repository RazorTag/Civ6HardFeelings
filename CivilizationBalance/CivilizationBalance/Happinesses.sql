-- Happinesses
-- Author: enors
-- DateCreated: 11/8/2017 9:24:13 PM
--------------------------------------------------------------
DELETE FROM Happinesses;

INSERT INTO Happinesses (HappinessType, Name, MaximumAmenityScore, GrowthModifier, NonFoodYieldModifier) VALUES('HAPPINESS_DEPRESSED', 'LOC_HAPPINESS_DEPRESSED_NAME', -10, -50, -50);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_SAD9', 'LOC_HAPPINESS_SAD9_NAME', -9, -9);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_SAD8', 'LOC_HAPPINESS_SAD8_NAME', -8, -9);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_SAD7', 'LOC_HAPPINESS_SAD7_NAME', -7, -7);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_SAD6', 'LOC_HAPPINESS_SAD6_NAME', -6, -6);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_SAD5', 'LOC_HAPPINESS_SAD5_NAME', -5, -5);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_SAD4', 'LOC_HAPPINESS_SAD4_NAME', -4, -4);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_SAD3', 'LOC_HAPPINESS_SAD3_NAME', -3, -3);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_SAD2', 'LOC_HAPPINESS_SAD2_NAME', -2, -2);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_SAD1', 'LOC_HAPPINESS_SAD1_NAME', -1, -1);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_CONTENT', 'LOC_HAPPINESS_CONTENT_NAME', 0, 0);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_HAPPY1', 'LOC_HAPPINESS_HAPPY1_NAME', 1, 1);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_HAPPY2', 'LOC_HAPPINESS_HAPPY2_NAME', 2, 2);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_HAPPY3', 'LOC_HAPPINESS_HAPPY3_NAME', 3, 3);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_HAPPY4', 'LOC_HAPPINESS_HAPPY4_NAME', 4, 4);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_HAPPY5', 'LOC_HAPPINESS_HAPPY5_NAME', 5, 5);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_HAPPY6', 'LOC_HAPPINESS_HAPPY6_NAME', 6, 6);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_HAPPY7', 'LOC_HAPPINESS_HAPPY7_NAME', 7, 7);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_HAPPY8', 'LOC_HAPPINESS_HAPPY8_NAME', 8, 8);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, MaximumAmenityScore) VALUES('HAPPINESS_HAPPY9', 'LOC_HAPPINESS_HAPPY9_NAME', 9, 9);
INSERT INTO Happinesses (HappinessType, Name, MinimumAmenityScore, GrowthModifier, NonFoodYieldModifier) VALUES('HAPPINESS_ECSTATIC', 'LOC_HAPPINESS_ECSTATIC_NAME', 10, 50, 50);

-- +/- 5% growth and yields for each level of happiness/unhappiness
UPDATE Happinesses SET GrowthModifier = 5*MaximumAmenityScore, NonFoodYieldModifier = 5*MaximumAmenityScore
WHERE NOT HappinessType = 'HAPPINESS_DEPRESSED' AND NOT HappinessType = 'HAPPINESS_ECSTATIC';

--No spntaneous rebellions at any unhappiness level
UPDATE Happinesses SET RebellionPoints = -1;
