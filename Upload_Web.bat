@echo off
echo GitHub par upload kiya ja raha hai...
cd /d F:\Sikander_Hayat_Baba\web

:: Initialize Git if not already done
if not exist ".git" (
    git init
    git remote add origin https://github.com/manoob977-svg/cash-book.git
)

:: Add and Commit
git add .
git commit -m "Final CashBook Web Build"

:: Push to GitHub
echo.
echo Username aur Password/Token enter karein agar poocha jaye:
git branch -M main
git push -u origin main --force

echo.
echo ======================================================
echo Done! Ab aap GitHub par check karein.
echo ======================================================
pause
