# =====================================================
# PDF Senpai — Phase 7: Google Setup Checklist
# =====================================================

## A. GOOGLE ANALYTICS 4 SETUP

### 1. Create a GA4 Property
1. Go to https://analytics.google.com
2. Click "Start measuring" → Create Account: "PDF Senpai"
3. Create Property: "pdfsenpai.com"  
   - Reporting timezone: India (UTC+5:30)
   - Currency: Indian Rupee (INR)
4. Choose Platform: Web
5. Enter website URL: https://pdfsenpai.com
6. Stream name: pdfsenpai-web
7. Copy your Measurement ID → it looks like: G-XXXXXXXXXX

### 2. Add GA4 to the Site
In Vercel → Project Settings → Environment Variables:
  VITE_GA_MEASUREMENT_ID = G-XXXXXXXXXX

Replace G-XXXXXXXXXX in frontend/index.html with your real ID.

Also replace in this HTML snippet (already in index.html):
  gtag('config', 'G-XXXXXXXXXX')

### 3. Enable Enhanced Measurements
In GA4 → Data Streams → Web stream → Enhanced measurement:
- [x] Page views
- [x] Scrolls
- [x] Outbound clicks
- [x] File downloads
- [x] Form submissions

---

## B. GOOGLE SEARCH CONSOLE SETUP

### 1. Add Property
1. Go to https://search.google.com/search-console
2. Add property → URL prefix: https://pdfsenpai.com
3. Choose verification method: "HTML tag"
4. Copy the meta tag that looks like:
   <meta name="google-site-verification" content="XXXXXXXXXXXXX" />

### 2. Add Verification Tag to HTML
Add the meta tag inside <head> in frontend/index.html:
  <meta name="google-site-verification" content="YOUR_CODE_HERE" />

Redeploy to Vercel, then click "Verify" in Search Console.

### 3. Submit Sitemap
In Search Console → Sitemaps:
- Add: https://pdfsenpai.com/sitemap.xml
- Click Submit

### 4. Request Indexing for Key Pages
In Search Console → URL Inspection:
- Inspect and request indexing for:
  1. https://pdfsenpai.com/
  2. https://pdfsenpai.com/pdf-to-word
  3. https://pdfsenpai.com/word-to-pdf
  4. https://pdfsenpai.com/merge-pdf
  5. https://pdfsenpai.com/blog

---

## C. GOOGLE ADSENSE APPLICATION

### Prerequisites (check all before applying)
- [x] Site has been live for at least 2-4 weeks
- [x] Site has original content (10+ blog articles + tool pages)
- [x] Privacy Policy page exists at /privacy-policy
- [x] Terms of Service page exists at /terms-of-service
- [x] Contact page or email listed on site
- [x] ads.txt file is at pdfsenpai.com/ads.txt
- [x] Site has real traffic (even 50+ daily visits helps)
- [x] No adult content, piracy links, or policy violations

### Application Steps
1. Go to https://adsense.google.com
2. Sign in with your Google account
3. Enter: https://pdfsenpai.com
4. Select content language: English
5. Add the AdSense script to index.html <head>:
   ```html
   <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-XXXXXXXXXXXXXXXX" crossorigin="anonymous"></script>
   ```
   Replace ca-pub-XXXXXXXXXXXXXXXX with your publisher ID.
6. Update ads.txt with your real publisher ID:
   google.com, pub-XXXXXXXXXXXXXXXX, DIRECT, f08c47fec0942fa0

### Ad Unit Placement (Design-Friendly)
- **Top Banner**: Below Navbar, above PrivacyBanner — 728×90 or Responsive
- **Sidebar** (desktop only): 300×250 Rectangle — appears on tool pages on screens ≥ 1024px
- **Below Result**: After file download is complete — 320×50 Mobile Banner or Responsive
- **Blog In-Article**: Between blog article sections — Native/In-Article format
- **NEVER** place ads overlapping the Convert or Download buttons (AdSense policy violation)

---

## D. TIMELINE EXPECTATION
- Day 1: Deploy site, add GA4 & Search Console
- Day 1-7: Publish first 2 blog articles
- Day 7: Submit AdSense application
- Day 7-21: AdSense review period (Google manually reviews)
- Day 21+: If approved, ads appear. First payment when you reach ₹7,000 threshold.

