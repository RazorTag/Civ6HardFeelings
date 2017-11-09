-- Districts
-- Author: enors
-- DateCreated: 11/9/2017 1:36:24 PM
--------------------------------------------------------------
--Make districts a constant production cost
UPDATE Districts SET Cost = 2*Cost, CostProgressionModel = 'NO_COST_PROGRESSION';

--Reduce yields of occupied cities

