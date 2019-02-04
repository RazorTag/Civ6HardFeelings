SET "copyFrom=C:\Projects\Civ6\HardFeelings\"
SET "copyTo=C:\Projects\Civ6\HardFeelings\Hard Feelings PvM\Hard Feelings PvM\"

xcopy /S "%copyFrom%GameBalance\CivilizationBalance" "%copyTo%GameBalance"
xcopy /S "%copyFrom%Difficulty\Difficulty" "%copyTo%Difficulty"
xcopy /S "%copyFrom%CulturalAppropriation\CulturalAppropriation" "%copyTo%CulturalAppropriation"
xcopy /S "%copyFrom%DynamicTurnTimer\DynamicTurnTimer" "%copyTo%DynamicTurnTimer"
xcopy /S "%copyFrom%FasterGameSpeeds\ExtraGameSettings" "%copyTo%FasterGameSpeeds"
xcopy /S "%copyFrom%Redistricting\Redistricting" "%copyTo%Redistricting"
xcopy /S "%copyFrom%TileBalancing\TileBalancing" "%copyTo%TileBalancing"


PAUSE