-- Policies
-- Author: enors
-- DateCreated: 12/9/2017 4:00:41 AM
--------------------------------------------------------------
--Opiate of the Masses policy
INSERT INTO Types (Type, Kind) VALUES ('POLICY_EPN_OPIATE_OF_THE_MASSES', 'KIND_POLICY');
INSERT INTO Policies (PolicyType, Name, Description, PrereqCivic, GovernmentSlotType)
VALUES ('POLICY_EPN_OPIATE_OF_THE_MASSES', 'LOC_POLICY_NAME_EPN_OPIATE_OF_THE_MASSES', 'LOC_POLICY_DESCRIPTION_EPN_OPIATE_OF_THE_MASSES', 'CIVIC_MYSTICISM', 'SLOT_MILITARY');

--Defines the +1 entertainment to holy site and lavra for Opiate of the masses
INSERT INTO PolicyModifiers (PolicyType, ModifierId) VALUES ('POLICY_EPN_OPIATE_OF_THE_MASSES', 'POLICY_EPN_OPIATE_OF_THE_MASSES_MODIFIER');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('POLICY_EPN_OPIATE_OF_THE_MASSES_MODIFIER', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_ENTERTAINMENT', 'DISTRICT_IS_HOLY_SITE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('POLICY_EPN_OPIATE_OF_THE_MASSES_MODIFIER', 'Amount', 1);
