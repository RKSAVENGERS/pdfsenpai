@echo off
title Push PDF Senpai to GitHub
cd /d "D:\PDFANIME"

echo.
echo ========================================================
echo    🌸 PDF SENPAI -- Push to GitHub
echo    Target: https://github.com/RKSAVENGERS/pdfsenpai.git
echo ========================================================
echo.

where git >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [!] Git is not installed or not in PATH.
    echo [*] Please download and install Git from: https://git-scm.com/download/win
    echo [*] Once installed, double-click this file again!
    echo.
    pause
    exit /b
)

echo [1/4] Initializing Git...
if not exist ".git" (
    git init
)

echo [2/4] Adding files...
git add .

echo [3/4] Committing codebase...
git commit -m "🌸 Launch: Complete PDF Senpai platform with 14 tools & manga styling"

echo [4/4] Configuring remote and pushing...
git branch -M main
git remote remove origin >nul 2>nul
git remote add origin https://github.com/RKSAVENGERS/pdfsenpai.git

git push -u origin main

echo.
echo ========================================================
echo    🎉 Push Complete! Check https://github.com/RKSAVENGERS/pdfsenpai
echo ========================================================
echo.
pause

