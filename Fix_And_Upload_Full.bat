@echo off
setlocal
echo ======================================================
echo CashBook Web Build: Subfolders Uploading Fix
echo ======================================================

:: Try to find git in common paths if not in PATH
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo Git path fix kiya ja raha hai...
    set PATH=%PATH%;C:\Program Files\Git\bin;F:\Sikander_Hayat_Baba\flutter_windows_3.41.6-stable\flutter\bin\cache\artifacts\engine\windows-x64\
)

cd /d F:\Sikander_Hayat_Baba\web\cash-book

:: Step 1: Remove old git data if it exists to start fresh
if exist ".git" (
    echo Purani Git configuration khatam ki ja rahi hai...
    rd /s /q .git
)

:: Step 2: Initialize Git
echo Naya Git repository initialize kiya ja raha hai...
git init

:: Step 3: Add Remote
git remote add origin https://github.com/manoob977-svg/cash-book.git

:: Step 4: Add ALL files and folders (Forcing subfolders)
echo Files add ki ja rahi hain (Subfolders ke saath)...
git add --all
git add assets/*
git add canvaskit/*
git add icons/*

:: Step 5: Commit
echo Commit kiya ja raha hai...
git commit -m "Fixed: Uploaded all files including assets, canvaskit, and icons"

:: Step 6: Push
echo.
echo GitHub par push kiya ja raha hai...
echo Agar login window khule toh apna account login karein.
git branch -M main
git push -u origin main --force

echo.
echo ======================================================
echo Done! Ab GitHub par check karein.
echo Subfolders (assets, canvaskit, icons) ab nazar aane chahiye.
echo ======================================================
pause
