-- Projects
-- Author: enors
-- DateCreated: 11/8/2017 6:12:31 PM
--------------------------------------------------------------
--Remove great person point generation from district projects since it cannot be balanced for different game speeds
UPDATE Project_GreatPersonPoints SET Points = 0;

--Double the project yields to compensate for loss of great person points
UPDATE Project_YieldConversions SET PercentOfProductionRate = PercentOfProductionRate*2;
UPDATE Projects SET AmenitiesWhileActive = AmenitiesWhileActive*3 WHERE ProjectType = 'PROJECT_CARNIVAL';

--Increases the cost of city projects so that they don't need to be refreshed each turn
UPDATE Projects SET Cost = 100, CostProgressionModel = 'COST_PROGRESSION_GAME_PROGRESS' WHERE (EXISTS (SELECT * FROM Project_YieldConversions WHERE ProjectType = Projects.ProjectType)) OR (ProjectType = 'PROJECT_CARNIVAL');

--Massively increases the cost of future tech and future civic so that they don't need to be refreshed
UPDATE Technologies SET Cost = 100000 WHERE TechnologyType = 'TECH_FUTURE_TECH';
UPDATE Civics SET Cost = 100000 WHERE CivicType = 'CIVIC_FUTURE_CIVIC';