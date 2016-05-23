@echo off

xcopy /y GameServer\bin\Debug\*.exe .\Bin\
xcopy /y GameServer\bin\Debug\*.dll .\Bin\
xcopy /y GameServer\bin\Debug\*.pdb .\Bin\

xcopy /y ZyGames.Doudizhu\GameServer.* .\Bin\ /EXCLUDE:copyfilter.txt
xcopy /y ZyGames.Doudizhu\NLog.config .\Bin\
xcopy /y ZyGames.Doudizhu\bin\Debug\ZyGames.Doudizhu.dll .\Bin\
xcopy /y ZyGames.Doudizhu\bin\Debug\ZyGames.Doudizhu.pdb .\Bin\
xcopy /y /s ZyGames.Doudizhu\Config\*.* .\Bin\Config\
xcopy /y /s ZyGames.Doudizhu\Script\*.* .\Bin\Script\

ECHO ·¢²¼Íê±Ï£¡& PAUSE