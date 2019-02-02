INSERT INTO Rulesets (RulesetType, Name,
					Description, SupportsSinglePlayer, SupportsMultiPlayer, SortIndex)
	VALUES	("RULESET_DEITYPLUSPLUS_FEWER_FREE_AI_UNITS", "RULESET_DEITYPLUSPLUS_FEWER_FREE_AI_UNITS_NAME",
					"RULESET_DEITYPLUSPLUS_FEWER_FREE_AI_UNITS_DESCRIPTION", 1, 0, 100),
			("RULESET_DEITYPLUSPLUS_NO_FREE_AI_UNITS", "RULESET_DEITYPLUSPLUS_NO_FREE_AI_UNITS_NAME",
					"RULESET_DEITYPLUSPLUS_NO_FREE_AI_UNITS_DESCRIPTION", 1, 0, 110);

UPDATE Rulesets SET Description="RULESET_DEITYPLUSPLUS_STANDARD_DESCRIPTION" WHERE RulesetType='RULESET_STANDARD';

INSERT INTO Difficulties (Domain, DifficultyType, Name, SortIndex) VALUES
	('StandardDifficulties', 'DIFFICULTY_DEITY_PLUS', 'LOC_DIFFICULTY_DEITY_PLUS_NAME', 90),
	('StandardDifficulties', 'DIFFICULTY_DEITY_PLUSPLUS', 'LOC_DIFFICULTY_DEITY_PLUSPLUS_NAME', 100);
