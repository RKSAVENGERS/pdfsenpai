Set-Location "D:\PDFANIME"

Write-Host ""
Write-Host "==========================================================" -ForegroundColor Magenta
Write-Host "   🌸 Pushing PDF Senpai to GitHub" -ForegroundColor Yellow
Write-Host "   Target: https://github.com/RKSAVENGERS/pdfsenpai.git" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Magenta
Write-Host ""

$gitCmd = Get-Command git -ErrorAction SilentlyContinue
if (-not $gitCmd) {
    Write-Host "[!] Git is not installed." -ForegroundColor Red
    Write-Host "[*] Downloading official Git for Windows (64-bit)..." -ForegroundColor Cyan
    $installerUrl = "https://github.com/git-for-windows/git/releases/download/v2.44.0.windows.1/Git-2.44.0-64-bit.exe"
    $installerPath = "$env:TEMP\GitInstaller.exe"
    
    Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath
    Write-Host "[*] Installing Git..." -ForegroundColor Cyan
    Start-Process -FilePath $installerPath -ArgumentList "/VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS" -Wait
    Remove-Item $installerPath -Force
    
    # Refresh PATH in current session
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

Write-Host "[1/4] Initializing Git repository..." -ForegroundColor Cyan
if (-not (Test-Path ".git")) {
    git init
}

Write-Host "[2/4] Staging all files..." -ForegroundColor Cyan
git add .

Write-Host "[3/4] Committing code..." -ForegroundColor Cyan
git commit -m "🌸 Launch: Complete PDF Senpai platform with 14 tools & manga styling"

Write-Host "[4/4] Pushing to https://github.com/RKSAVENGERS/pdfsenpai.git..." -ForegroundColor Cyan
git branch -M main

$existingRemote = git remote get-url origin 2>$null
if ($existingRemote) {
    git remote set-url origin https://github.com/RKSAVENGERS/pdfsenpai.git
} else {
    git remote add origin https://github.com/RKSAVENGERS/pdfsenpai.git
}

git push -u origin main

Write-Host ""
Write-Host "==========================================================" -ForegroundColor Green
Write-Host "   🎉 Done! Code is live on GitHub:" -ForegroundColor Green
Write-Host "   https://github.com/RKSAVENGERS/pdfsenpai" -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Green
Write-Host ""
Pause
