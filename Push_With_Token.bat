@echo off
setlocal
echo ======================================================
echo GitHub Upload with Token
echo ======================================================

set "GIT_EXE=F:\Sikander_Hayat_Baba\flutter_windows_3.41.6-stable\flutter\bin\mingit\cmd\git.exe"

set /p TOKEN="Apna GitHub Token yahan paste karein: "

if "%TOKEN%"=="" (
    echo ERROR: Token khali hai!
    pause
    exit /b
)

cd /d F:\Sikander_Hayat_Baba\web\cash-book

echo Identity set ki ja rahi hai...
"%GIT_EXE%" config user.email "uploader@example.com"
"%GIT_EXE%" config user.name "CashBook Uploader"

echo Files add ki ja rahi hain...
"%GIT_EXE%" add .

echo Commit kiya ja raha hai...
"%GIT_EXE%" commit -m "Upload all files with token"

echo Remote URL update ki ja rahi hai...
"%GIT_EXE%" remote set-url origin https://%TOKEN%@github.com/manoob977-svg/cash-book.git

echo Push kiya ja raha hai...
"%GIT_EXE%" branch -M main
"%GIT_EXE%" push -u origin main --force

echo ======================================================
echo Done! Ab GitHub par check karein.
echo ======================================================
pause
