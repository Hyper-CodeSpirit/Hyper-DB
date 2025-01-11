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

REM Define environment variables
set hostname=%HOSTNAME%
set username=%USERNAME%
set database_name=%DATABASE_NAME%
set port=%PORT%
set PGPASSWORD=%PASSWORD%

REM Define SQL file path
set sql_file_path=%~dp0./Build-Scripts/master.sql

REM Check if the database exists and drop it
echo "Checking if database '%database_name%' exists..."

psql -h %hostname% -p %port% -U %username% -d postgres -tAc "SELECT 1 FROM pg_database WHERE datname='%database_name%'" | findstr "1" >nul
if %errorlevel% equ 0 (
    echo "Database '%database_name%' exists. Dropping it..."
    psql -h %hostname% -p %port% -U %username% -d postgres -c "DROP DATABASE %database_name%;"
    if %errorlevel% neq 0 (
        echo "Failed to drop the database '%database_name%'."
        set PGPASSWORD=
        pause
        exit /b 1
    )
) else (
    echo "Database '%database_name%' does not exist."
)

REM Create the new database
echo "Creating database '%database_name%'..."
psql -h %hostname% -p %port% -U %username% -d postgres -c "CREATE DATABASE %database_name%;"
if %errorlevel% neq 0 (
    echo "Failed to create the database '%database_name%'."
    set PGPASSWORD=
    pause
    exit /b 1
)

REM Execute SQL commands on the new database
echo "Executing SQL commands on '%database_name%'..."
psql -h %hostname% -p %port% -U %username% -d %database_name% -f "%sql_file_path%"
if %errorlevel% neq 0 (
    echo "Failed to execute SQL commands on '%database_name%'."
    set PGPASSWORD=
    pause
    exit /b 1
)

REM Clear sensitive environment variable
set PGPASSWORD=

echo "SQL commands executed successfully on '%database_name%' database."
pause
