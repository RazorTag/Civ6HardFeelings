-- GreatGeneralAdmiral
-- Author: Doomturtle
-- DateCreated: 8/20/2018 12:12:45 AM
--------------------------------------------------------------

--Remove the charge from great general/admirals that provide a military unit.
UPDATE GreatPersonIndividuals SET ActionCharges = 0
WHERE ActionCharges AND ActionRequiresNoMilitaryUnit;

--Return the charge for great general/admirals that provide an ancient era military unit.
UPDATE GreatPersonIndividuals SET ActionCharges = 1
WHERE GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_THEMISTOCLES';