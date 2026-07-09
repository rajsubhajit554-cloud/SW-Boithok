@echo off
:: Set text color to Green on Black
color 0A
cls

echo ========================================================
echo               SW-Boithok Git Auto Update
echo ========================================================
echo.

:: Step 1: Check if git is installed
where git >nul 2>nul
if %errorlevel% neq 0 (
    color 0C
    echo [ERROR] Git is not installed or not added to system PATH.
    echo Please install Git from https://git-scm.com/ and try again.
    echo.
    pause
    exit /b
)

:: Step 2: Show current changes
echo [INFO] Checking local changes...
echo --------------------------------------------------------
git status -s
echo --------------------------------------------------------
echo.

:: Step 3: Prompt for commit message
set "commit_msg="
set /p commit_msg="Enter commit message (Press Enter for 'website update'): "
if "%commit_msg%"=="" set commit_msg=website update

echo.
echo [1/3] Staging all files...
git add .

echo.
echo [2/3] Committing changes...
git commit -m "%commit_msg%"

echo.
echo [3/3] Pushing changes to GitHub (origin main)...
git push origin main

echo.
echo ========================================================
echo                     Git Update Finished!
echo ========================================================
echo.
pause
