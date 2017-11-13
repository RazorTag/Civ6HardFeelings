-- Projects
-- Author: enors
-- DateCreated: 11/8/2017 6:12:31 PM
--------------------------------------------------------------
--Remove great person point generation from district projects since it cannot be balanced for different game speeds
UPDATE Project_GreatPersonPoints SET Points = 0;

--Double the project yields to compensate for loss of great person points
UPDATE Project_YieldConversions SET PercentOfProductionRate = PercentOfProductionRate*2;
UPDATE Projects SET AmenitiesWhileActive = AmenitiesWhileActive*3 WHERE ProjectType = 'PROJECT_CARNIVAL';