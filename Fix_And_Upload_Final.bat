@echo off
setlocal
echo ======================================================
echo CashBook Web Build: FINAL UPLOAD FIX
echo ======================================================

:: Set Git Path
set "GIT_EXE=F:\Sikander_Hayat_Baba\flutter_windows_3.41.6-stable\flutter\bin\mingit\cmd\git.exe"

:: Verify if Git exists at that path
if not exist "%GIT_EXE%" (
    echo Git not found in Flutter folder. Searching in standard path...
    if exist "C:\Program Files\Git\bin\git.exe" (
        set "GIT_EXE=C:\Program Files\Git\bin\git.exe"
    ) else (
        echo ERROR: Git nahi mila! Meharbani karke Git install karein ya path sahi karein.
        pause
        exit /b
    )
)

echo Git Found at: %GIT_EXE%

cd /d F:\Sikander_Hayat_Baba\web\cash-book

:: Step 1: Remove old git data
if exist ".git" (
    echo Resetting Git...
    rd /s /q .git
)

:: Step 2: Initialize Git
"%GIT_EXE%" init

:: Step 3: Add Remote
"%GIT_EXE%" remote add origin https://github.com/manoob977-svg/cash-book.git

:: Step 4: Add ALL files and folders
echo Adding assets, canvaskit, and icons...
"%GIT_EXE%" add .
"%GIT_EXE%" add assets/*
"%GIT_EXE%" add canvaskit/*
"%GIT_EXE%" add icons/*

:: Step 5: Set Identity (Fix for "Please tell me who you are")
echo Setting temporary Git identity...
"%GIT_EXE%" config user.email "uploader@example.com"
"%GIT_EXE%" config user.name "CashBook Uploader"

:: Step 6: Commit
echo Committing files...
"%GIT_EXE%" commit -m "Final Upload with all subfolders"

:: Step 7: Push
echo.
echo GitHub par push kiya ja raha hai...
echo Agar login window khule toh apna account login karein.
"%GIT_EXE%" config --global credential.helper manager
"%GIT_EXE%" branch -M main
"%GIT_EXE%" push -u origin main --force

echo.
echo ======================================================
echo Done! Ab aap GitHub par check karein.
echo ======================================================
pause
