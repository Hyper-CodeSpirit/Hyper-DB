@echo off

REM Load variables from .env file
for /f "tokens=1,2 delims== " %%A in (.env) do set %%A=%%B

REM Display loaded variables (optional for debugging)
echo Loaded variables:
echo HOSTNAME=%HOSTNAME%
echo PORT=%PORT%
echo USERNAME=%USERNAME%
echo DATABASE_NAME=%DATABASE_NAME%
echo PASSWORD=******


set hostname=%HOSTNAME%
set username=%USERNAME%
set database_name=%DATABASE_NAME%
set port=%PORT%
set PGPASSWORD=%PASSWORD%

REM Define SQL file path
set sql_file_path=%~dp0./Patch-Scripts/master.sql

REM Execute SQL commands
echo "Executing SQL commands on %database_name% database..."
echo Current Directory:
cd

psql -h %hostname% -p %port% -U %username% -d %database_name% -f %sql_file_path%
set PGPASSWORD=

echo "SQL commands executed successfully on %database_name% database."

