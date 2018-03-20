-- Projects
-- Author: enors
-- DateCreated: 12/11/2017 6:06:42 PM
--------------------------------------------------------------
--Increases the cost of city projects so that they don't need to be refreshed each turn
UPDATE Projects SET Cost = Cost*10 WHERE (EXISTS (SELECT * FROM Project_YieldConversions WHERE ProjectType = Projects.ProjectType)) OR (ProjectType = 'PROJECT_CARNIVAL');