@echo off

for %%I in (.) do set CurrDirName=%%~nxI

set FOLDERNAME=%CurrDirName%
set ZIPFILE=%FOLDERNAME%.zip
set SOURCEFOLDER=./

rem delete old zip file
del "%ZIPFILE%"

rem Exclude these files and folders from the copy
set EXCLUDEFILES=*.bat *.zip *.gitignore *.docx *.pdf gulpfile.js package.json package-lock.json .git
set EXCLUDEFOLDERS=node_modules mockup-images build .git

rem Use robocopy to copy the folder to a temporary directory
robocopy "%SOURCEFOLDER%" "%TEMP%\%FOLDERNAME%" /E /XD %EXCLUDEFOLDERS% /XF %EXCLUDEFILES%

rem Use PowerShell to create a zip file of the temporary directory
powershell -Command "Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::CreateFromDirectory('%TEMP%\%FOLDERNAME%', '%ZIPFILE%')"

rem Clean up the temporary directory
rmdir /s /q "%TEMP%\%FOLDERNAME%"

set ZIPFILEMAIN=%FOLDERNAME%-packages.zip
del "%ZIPFILEMAIN%"
set FILEMASK=%FOLDERNAME%.zip,*documentation*.pdf

powershell -Command "Compress-Archive -Path %FILEMASK% -DestinationPath %ZIPFILEMAIN%"
