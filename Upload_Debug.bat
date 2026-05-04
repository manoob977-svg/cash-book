@echo off
setlocal
set LOGFILE=upload_log.txt
echo ====================================================== > %LOGFILE%
echo CashBook Upload Debug Log >> %LOGFILE%
echo Date: %DATE% %TIME% >> %LOGFILE%
echo ====================================================== >> %LOGFILE%

cd /d F:\Sikander_Hayat_Baba\web\cash-book >> %LOGFILE% 2>&1
echo Current Directory: %CD% >> %LOGFILE%

:: Check if git is available
echo Checking Git... >> %LOGFILE%
git --version >> %LOGFILE% 2>&1
if %errorlevel% neq 0 (
    echo Git not found in PATH. Trying fallback... >> %LOGFILE%
    set PATH=%PATH%;C:\Program Files\Git\bin;F:\Sikander_Hayat_Baba\flutter_windows_3.41.6-stable\flutter\bin\cache\artifacts\engine\windows-x64\
    git --version >> %LOGFILE% 2>&1
)

:: Check folders
echo Checking Folders... >> %LOGFILE%
dir /b assets >> %LOGFILE% 2>&1
dir /b canvaskit >> %LOGFILE% 2>&1
dir /b icons >> %LOGFILE% 2>&1

:: Git operations
echo Resetting Git... >> %LOGFILE%
if exist ".git" rd /s /q .git >> %LOGFILE% 2>&1
git init >> %LOGFILE% 2>&1
git remote add origin https://github.com/manoob977-svg/cash-book.git >> %LOGFILE% 2>&1

echo Adding files... >> %LOGFILE%
git add . --verbose >> %LOGFILE% 2>&1
git add assets/* --verbose >> %LOGFILE% 2>&1
git add canvaskit/* --verbose >> %LOGFILE% 2>&1
git add icons/* --verbose >> %LOGFILE% 2>&1

echo Committing... >> %LOGFILE%
git commit -m "Debug upload" >> %LOGFILE% 2>&1

echo Pushing... >> %LOGFILE%
echo (Note: Push might hang if asking for login, check terminal) >> %LOGFILE%
git branch -M main >> %LOGFILE% 2>&1
:: We won't log push output directly to avoid hanging the script if it waits for input, 
:: but we'll try to push in the background or just tell the user.
echo Running push...
git push -u origin main --force

echo ====================================================== >> %LOGFILE%
echo Log Complete. >> %LOGFILE%
echo Please tell the AI the content of upload_log.txt if it failed.
pause
