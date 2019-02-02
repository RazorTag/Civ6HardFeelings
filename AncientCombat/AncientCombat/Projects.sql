-- Projects
-- Author: Doomturtle
-- DateCreated: 8/18/2018 7:28:04 PM
--------------------------------------------------------------

--Remove nuclear weapons projects
DELETE FROM Projects WHERE
(
	ProjectType = 'PROJECT_MANHATTAN_PROJECT' OR
	ProjectType = 'PROJECT_OPERATION_IVY' OR
	ProjectType = 'PROJECT_BUILD_NUCLEAR_DEVICE' OR
	ProjectType = 'PROJECT_BUILD_THERMONUCLEAR_DEVICE'
);