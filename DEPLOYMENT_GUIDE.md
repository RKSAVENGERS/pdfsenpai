# =====================================================
# PDF Senpai — Complete Deployment Guide (Phase 6)
# =====================================================

## STEP 1: Install Git on Your HP Victus
Download from https://git-scm.com/download/win and install.
Restart PowerShell after install. Verify with:
  git --version

## STEP 2: Initialize Git Repository

```powershell
cd D:\PDFANIME
git init
git add .
git commit -m "🌸 feat: initial PDF Senpai launch (Phase 1-8)"
```

## STEP 3: Create GitHub Repository
1. Go to https://github.com/new
2. Repository name: pdfsenpai
3. Visibility: Private (keep it private until launch)
4. Click "Create repository"
5. Run these commands in PowerShell:

```powershell
cd D:\PDFANIME
git remote add origin https://github.com/YOUR_USERNAME/pdfsenpai.git
git branch -M main
git push -u origin main
```

---

## STEP 4: Deploy Backend on Render (Free Tier)

1. Go to https://render.com and sign up with GitHub
2. Click "New +" → "Web Service"
3. Connect to your GitHub repo → select "pdfsenpai"
4. Configure the service:
   - **Name**: pdfsenpai-backend
   - **Root Directory**: backend
   - **Environment**: Docker
   - **Region**: Singapore (closest to India, free)
   - **Plan**: Free
5. Set Environment Variables (click "Advanced" → "Add Environment Variable"):
   ```
   ENVIRONMENT = production
   PORT = 8000
   CORS_ORIGINS = ["https://pdfsenpai.com","https://pdfsenpai.vercel.app"]
   MAX_FREE_FILE_SIZE_MB = 25
   MAX_FREE_FILES_COUNT = 5
   FILE_EXPIRY_MINUTES = 30
   RATE_LIMIT_PER_MINUTE = 20/minute
   ```
6. Click "Create Web Service"
7. Wait 5-10 minutes for Docker build (LibreOffice is large ~400 MB)
8. Note your backend URL: https://pdfsenpai-backend.onrender.com

### Keep Render Free Tier Awake
Render free tier sleeps after 15 min inactivity.
1. Go to https://uptimerobot.com → Create free account
2. Add Monitor → HTTP(s) Monitor:
   - URL: https://pdfsenpai-backend.onrender.com/api/v1/health
   - Check interval: 5 minutes
   - Alert: Email when down
3. This keeps your backend warm 24/7 at zero cost.

---

## STEP 5: Deploy Frontend on Vercel

1. Go to https://vercel.com and sign up with GitHub
2. Click "Add New" → "Project"
3. Import your GitHub repo "pdfsenpai"
4. Configure:
   - **Framework Preset**: Vite
   - **Root Directory**: frontend
   - **Build Command**: npm run build
   - **Output Directory**: dist
5. Add Environment Variables:
   ```
   VITE_API_URL = https://pdfsenpai-backend.onrender.com/api/v1
   VITE_GA_MEASUREMENT_ID = G-XXXXXXXXXX  (add after Phase 7)
   ```
6. Click "Deploy"
7. Your site is live at: https://pdfsenpai.vercel.app

---

## STEP 6: Buy a Custom Domain (Optional but Recommended for AdSense)

**Recommended registrars (cheapest):**
- Hostinger: .com ≈ ₹999/year (cheapest for India)
- Namecheap: .com ≈ $9.98/year (cards accepted)
- GoDaddy: .com ≈ ₹999 first year

**Recommended domain names (check availability):**
- pdfsenpai.com (ideal)
- pdfsenpai.in
- senpai-pdf.com

### Connect Domain to Vercel
1. In Vercel → your project → Settings → Domains
2. Add your domain: pdfsenpai.com
3. Vercel shows two DNS records to add. Go to your domain registrar:
4. Add DNS Records at registrar (Hostinger/Namecheap):
   ```
   Type: A      Name: @       Value: 76.76.21.21
   Type: CNAME  Name: www     Value: cname.vercel-dns.com
   ```
5. Wait 15-30 minutes for DNS propagation
6. Vercel auto-provisions SSL/HTTPS certificate (Let's Encrypt)

### Update Backend CORS After Custom Domain
In Render dashboard → Environment Variables:
  CORS_ORIGINS = ["https://pdfsenpai.com","https://www.pdfsenpai.com"]

---

## STEP 7: Verify Everything Works
Test these URLs:
- https://pdfsenpai.com/ → Homepage loads
- https://pdfsenpai.com/pdf-to-word → Tool page loads
- https://pdfsenpai-backend.onrender.com/api/v1/health → returns {"status":"healthy"}
- https://pdfsenpai-backend.onrender.com/docs → FastAPI Swagger UI
- https://pdfsenpai.com/sitemap.xml → Sitemap renders
- https://pdfsenpai.com/robots.txt → robots file renders
- https://pdfsenpai.com/ads.txt → ads.txt renders (needed for AdSense)

