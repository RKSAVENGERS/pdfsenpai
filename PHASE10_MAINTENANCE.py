# Phase 10 — Sentry & Maintenance Guide
# ============================================================

SENTRY_DSN = ""  # Set in Render env as SENTRY_DSN=https://xxxx@sentry.io/xxxxx

# HOW TO SET UP SENTRY (Phase 10):
#
# 1. Go to https://sentry.io → Create account (free: 5,000 events/mo)
# 2. Create a new Project → Platform: FastAPI (Python)
# 3. Copy your DSN (looks like: https://abc123@o12345.ingest.sentry.io/67890)
# 4. In Render dashboard → Environment Variables:
#       SENTRY_DSN = https://abc123@o12345.ingest.sentry.io/67890
# 5. The backend already has Sentry SDK configured in app/main.py:
#       It automatically captures unhandled exceptions & performance traces
#
# FRONTEND SENTRY (optional):
# 1. Create separate Browser JS project in Sentry
# 2. npm install @sentry/react
# 3. In src/main.tsx add:
#    import * as Sentry from "@sentry/react";
#    Sentry.init({ dsn: "YOUR_FRONTEND_DSN", tracesSampleRate: 0.1 });

MAINTENANCE_SCHEDULE = {
    "weekly": [
        "Check Render logs for errors",
        "Check UptimeRobot incident history",
        "Publish 1 new blog article for SEO",
        "Check Google Search Console for crawl errors",
    ],
    "monthly": [
        "pip install -r requirements.txt --upgrade (test locally first)",
        "npm update (test build: npm run build)",
        "Review Sentry error dashboard",
        "Check Vercel analytics for top-traffic pages",
        "Review AdSense RPM and optimize ad placement if needed",
        "Check Core Web Vitals in Google Search Console",
    ],
    "cost_tracking": {
        "Render (free)": "$0/mo (sleeps, kept awake by UptimeRobot)",
        "Vercel (free)": "$0/mo (100 GB bandwidth included)",
        "UptimeRobot (free)": "$0/mo (50 monitors included)",
        "Sentry (free)": "$0/mo (5,000 events/month)",
        "Domain (pdfsenpai.com)": "~₹999/year (~₹83/mo)",
        "Total at launch": "~₹83/month (just the domain!)",
    },
    "upgrade_triggers": {
        "Render paid ($7/mo)": "When backend has >1000 req/day or needs always-on server",
        "Vercel Pro ($20/mo)": "When monthly bandwidth exceeds 100 GB",
        "Sentry Team ($26/mo)": "When you need >5000 error events/month",
    }
}

ROADMAP_V3 = [
    "PDF to Excel (camelot + openpyxl)",
    "Protect PDF (pypdf encryption)",
    "Remove PDF password (pypdf decrypt)",
    "Add watermark to PDF",
    "Add page numbers to PDF",
    "Reorder/delete pages (drag-and-drop UI)",
    "OCR PDF (Tesseract) — scanned document text extraction",
    "Hindi language UI (i18n with react-i18next)",
    "Supabase Auth (login to track premium subscription)",
    "Subscription management portal (cancel, upgrade, download invoices)",
]

