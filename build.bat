@echo off

set ZIPFILE=test.zip
set SOURCEFOLDER=C:\Users\serma\Desktop\test

rem delete old zip file
del "%ZIPFILE%"

rem Exclude these files and folders from the copy
set EXCLUDEFILES=*.sh *.bat
set EXCLUDEFOLDERS=ssr-csr

rem Use robocopy to copy the folder to a temporary directory
robocopy "%SOURCEFOLDER%" "%TEMP%\test" /E /XD %EXCLUDEFOLDERS% /XF %EXCLUDEFILES%

rem Use PowerShell to create a zip file of the temporary directory
powershell -Command "Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::CreateFromDirectory('%TEMP%\test', '%ZIPFILE%')"

rem Clean up the temporary directory
rmdir /s /q "%TEMP%\test"
