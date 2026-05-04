@echo off
echo Vercel par Direct Deploy kiya ja raha hai...
cd /d F:\Sikander_Hayat_Baba\web

:: Run Vercel deployment (Using npx so no installation needed)
echo.
echo NOTE: Agar ye pehli baar hai, to ye aapse Login maang sakta hai.
echo Screen par diye gaye instructions follow karein.
echo.
call npx vercel --prod

echo.
echo ======================================================
echo Done! Upar diye gaye link par click karke apni app check karein.
echo ======================================================
pause
