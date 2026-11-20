# ============================================================
# PDF Senpai — One-Click Local Setup & Test Script
# Run from D:\PDFANIME\  (right-click → Run with PowerShell)
# ============================================================

Write-Host ""
Write-Host "🌸 PDF SENPAI — Project Setup Script" -ForegroundColor Magenta
Write-Host "======================================" -ForegroundColor DarkMagenta
Write-Host ""

$rootDir = "D:\PDFANIME"
Set-Location $rootDir

# ── 1. Check Python ──────────────────────────────────────────────────────────
Write-Host "[1/5] Checking Python..." -ForegroundColor Cyan
try {
    $pyVer = python --version 2>&1
    Write-Host "      ✓ $pyVer found" -ForegroundColor Green
} catch {
    Write-Host "      ✗ Python not found. Install from python.org" -ForegroundColor Red; exit 1
}

# ── 2. Backend venv & deps ───────────────────────────────────────────────────
Write-Host "[2/5] Setting up Python backend..." -ForegroundColor Cyan
Set-Location "$rootDir\backend"

if (-not (Test-Path "venv")) {
    Write-Host "      Creating virtual environment..." -ForegroundColor Yellow
    python -m venv venv
}

Write-Host "      Activating venv & installing dependencies..." -ForegroundColor Yellow
& ".\venv\Scripts\Activate.ps1"
pip install -r requirements.txt --quiet

Write-Host "      ✓ Backend dependencies installed" -ForegroundColor Green

# ── 3. Create .env if missing ────────────────────────────────────────────────
if (-not (Test-Path ".env")) {
    Write-Host "      Creating backend .env from example..." -ForegroundColor Yellow
    Copy-Item "$rootDir\.env.example" ".env"
}

# ── 4. Frontend deps ─────────────────────────────────────────────────────────
Write-Host "[3/5] Installing frontend npm packages..." -ForegroundColor Cyan
Set-Location "$rootDir\frontend"

if (-not (Test-Path "node_modules")) {
    npm install
} else {
    Write-Host "      ✓ node_modules already exists" -ForegroundColor Green
}

# ── 5. Run tests ─────────────────────────────────────────────────────────────
Write-Host "[4/5] Running backend test suite..." -ForegroundColor Cyan
Set-Location "$rootDir\backend"
& ".\venv\Scripts\Activate.ps1"
pytest tests/ -v --tb=short

# ── 6. Launch servers ────────────────────────────────────────────────────────
Write-Host ""
Write-Host "[5/5] Starting dev servers..." -ForegroundColor Cyan
Write-Host ""
Write-Host "  Backend  → http://localhost:8000" -ForegroundColor Green
Write-Host "  API Docs → http://localhost:8000/docs" -ForegroundColor Green
Write-Host "  Frontend → http://localhost:5173" -ForegroundColor Magenta
Write-Host ""
Write-Host "  Press Ctrl+C to stop both servers." -ForegroundColor DarkGray
Write-Host ""

# Start backend in background job
$backendJob = Start-Job -ScriptBlock {
    Set-Location "D:\PDFANIME\backend"
    & ".\venv\Scripts\Activate.ps1"
    python -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
}

Start-Sleep -Seconds 3

# Start frontend in foreground
Set-Location "$rootDir\frontend"
npm run dev

