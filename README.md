# 🌸 PDF Senpai (PDF2EDIT) - Anime-Flavored PDF Toolbox

> A high-performance, neon-cyberpunk anime-themed free online PDF toolbox built with React, Vite, Tailwind CSS, FastAPI, and Docker.

---

## 🚀 Monorepo Architecture
```
PDFANIME/
├── frontend/                # React 18 + Vite + TypeScript + Tailwind CSS + Framer Motion
│   ├── public/              # Static assets, robots.txt, sitemap.xml
│   ├── src/
│   │   ├── components/      # UI components (Navbar, Mascot, GlassCard, Dropzone, etc.)
│   │   ├── pages/           # Tool pages (/pdf-to-word, /merge-pdf, etc.) + Legal & Blog
│   │   ├── services/        # API client for conversions
│   │   ├── store/           # Local state, themes (Sakura, Night City, Cyber Ninja), XP counter
│   │   └── types/
├── backend/                 # Python 3.11/3.12 + FastAPI + Docker
│   ├── app/
│   │   ├── api/v1/          # Endpoints (convert, merge, health, stats)
│   │   ├── core/            # Config, security, rate-limiting, mime validation
│   │   ├── services/        # Conversion engines (pdf2docx, LibreOffice headless, pypdf)
│   │   └── tasks/           # Auto-cleanup background worker (30 min TTL)
│   ├── tests/               # Pytest suite
│   ├── Dockerfile           # Production container with LibreOffice headless
│   └── requirements.txt     # Python dependencies
├── .gitignore
├── .env.example
├── CREDITS.md               # Licenses & Asset Attribution
└── README.md
```

## 🛠 Local Setup Instructions (Windows)

### 1. Backend Setup
```powershell
cd D:\PDFANIME\backend
python -m venv venv
.\venv\Scripts\Activate.ps1
pip install -r requirements.txt
python -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
```

### 2. Frontend Setup
```powershell
cd D:\PDFANIME\frontend
npm install
npm run dev
```
Open [http://localhost:5173](http://localhost:5173) in your browser.

