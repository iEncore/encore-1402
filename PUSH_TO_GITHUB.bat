@echo off
echo ========================================
echo  Encore 14.02 - GitHub Pages Deploy
echo ========================================
echo.

cd /d "%~dp0"

echo [1] Checking git...
where git >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Git ist nicht installiert!
    echo Download: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo [2] Initializing repo...
git init
git branch -M main

echo [3] Adding files...
git add -A

echo [4] Committing...
git commit -m "Encore 14.02 JB - initial deploy"

echo [5] Setting remote...
set /p GHUSER="Dein GitHub Username (z.B. iEncore): "
git remote add origin https://github.com/%GHUSER%/encore-1402.git 2>nul
git remote set-url origin https://github.com/%GHUSER%/encore-1402.git

echo.
echo !! WICHTIG: Erstelle ZUERST das Repo auf GitHub !!
echo    1. Geh zu: https://github.com/new
echo    2. Name: encore-1402
echo    3. Public
echo    4. KEIN README/License/gitignore
echo    5. Create repository
echo.
pause

echo [6] Pushing...
git push -u origin main

echo.
echo ========================================
echo  DONE! Jetzt GitHub Pages aktivieren:
echo  Settings - Pages - Branch: main - Save
echo  URL: https://%GHUSER%.github.io/encore-1402/
echo ========================================
pause
