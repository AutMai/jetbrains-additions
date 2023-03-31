@echo off

setlocal enabledelayedexpansion

set "template_file=.\datagrip\live-templates\mongo-aggregate.xml"
set "datagrip_folder="
set "highest_version=0"

for /d %%a in ("%appdata%\JetBrains\Datagrip*") do (
  set "current_folder=%%~nxa"
  set "version_number=!current_folder:Datagrip=!"
  set "version_number=!version_number:.=!"

  if !version_number! GTR !highest_version! (
    set "datagrip_folder=!current_folder!"
    set "highest_version=!version_number!"
  )
)

if "%datagrip_folder%"=="" (
  echo Error: JetBrains Datagrip folder not found.
  pause
  exit /b 1
)

set "destination_folder=%appdata%\JetBrains\%datagrip_folder%\templates"

if not exist "%destination_folder%" (
  echo Creating templates folder...
  mkdir "%destination_folder%"
)

echo Moving templates.xml to %destination_folder%...
xcopy "%template_file%" "%destination_folder%"

echo Done.