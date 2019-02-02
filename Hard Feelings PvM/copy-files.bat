SET "copyFrom=C:\Projects\Civ6\HardFeelings\"
SET "copyTo=C:\Projects\Civ6\HardFeelings\Hard Feelings PvM\Hard Feelings PvM\"

xcopy /S /Y "%copyFrom%GameBalance\CivilizationBalance" "%copyTo%GameBalance"
xcopy /S /Y "%copyFrom%Difficulty\Difficulty" "%copyTo%Difficulty"
xcopy /S /Y "%copyFrom%CulturalAppropriation\CulturalAppropriation" "%copyTo%CulturalAppropriation"
xcopy /S /Y "%copyFrom%DynamicTurnTimer\DynamicTurnTimer" "%copyTo%DynamicTurnTimer"
xcopy /S /Y "%copyFrom%FasterGameSpeeds\ExtraGameSettings" "%copyTo%FasterGameSpeeds"
xcopy /S /Y "%copyFrom%Redistricting\Redistricting" "%copyTo%Redistricting"
xcopy /S /Y "%copyFrom%TileBalancing\TileBalancing" "%copyTo%TileBalancing"


PAUSE