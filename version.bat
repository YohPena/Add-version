@echo off

REM Chemin vers le fichier version.m
set "versionFilePath=Version.m"

REM Lire la version actuelle
for /F "usebackq tokens=2 delims=''" %%G in ("%versionFilePath%") do set "currentVersion=%%G"

REM Incrémenter la version
for /F "tokens=1,2,3 delims=." %%A in ("%currentVersion%") do (
    set /A major=%%A, minor=%%B, patch=%%C
)

REM Incrémenter la version mineure
REM set /A minor+=1

REM Réinitialiser le patch à 0
set /A patch+=1

REM Construire la nouvelle version
set "newVersion=%major%.%minor%.%patch%"

REM Mettre à jour la version dans le fichier version.m
powershell -Command "(gc \"%versionFilePath%\") -replace \"%currentVersion%\", \"%newVersion%\" | sc \"%versionFilePath%\""

REM Effectuer le commit et le push avec le message de version
git add -A
git commit -m "Version %newVersion%"
git push origin dev