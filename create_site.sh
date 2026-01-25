#!/usr/bin/env bash
set -e

ROOT="$(pwd)"
mkdir -p assets/css assets/js assets/data assets/img assets/videos

# -------------------------
# CONTENT (edit here)
# -------------------------
cat > assets/data/content.json <<'JSON'
{
  "brand": {
    "name": "JM Calcários",
    "tagline": "Calcário agrícola e britas com entrega própria",
    "city": "Campos Belos - GO",
    "whatsappNumberE164": "556296405492",
    "whatsappDisplay": "+55 (62) 9640-5492",
    "serviceAreas": ["GO", "TO", "BA"],
    "logoPath": "assets/img/logo.png",
    "faviconPath": "assets/img/favicon.png"
  },
  "seo": {
    "siteUrl": "https://SEU-DOMINIO-AQUI.com.br",
    "defaultTitle": "JM Calcários | Calcário Agrícola e Britas em Campos Belos - GO",
    "defaultDescription": "JM Calcários em Campos Belos - GO. Calcário agrícola e britas com entrega própria para GO, TO e BA. Orçamento rápido no WhatsApp.",
    "keywords": [
      "calcário agrícola", "brita", "Campos Belos", "Goiás", "Tocantins", "Bahia",
      "correção de solo", "construção civil", "agro", "mineração"
    ]
  },
  "hero": {
    "headline": "Calcário Agrícola e Britas com entrega própria",
    "subheadline": "Atendemos GO, TO e BA com agilidade, padrão de qualidade e atendimento rápido.",
    "primaryCtaText": "Pedir orçamento no WhatsApp",
    "secondaryCtaText": "Ver produtos",
    "heroImage": "assets/img/hero.jpg",
    "heroVideo": "assets/videos/hero.mp4",
    "useVideoIfAvailable": true
  },
  "products": [
    {
      "name": "Calcário Agrícola",
      "subtitle": "Correção de solo e aumento de produtividade",
      "description": "Fornecimento de calcário agrícola com padrão e constância, ideal para correção da acidez do solo e melhoria do desempenho da lavoura.",
      "image": "assets/img/prod-calcario.jpg",
      "highlights": ["Correção de acidez", "Apoio ao manejo", "Fornecimento organizado"]
    },
    {
      "name": "Britas",
      "subtitle": "Material para construção civil e bases",
      "description": "Britas para obras e construção civil. Opções podem variar conforme disponibilidade e necessidade do cliente.",
      "image": "assets/img/prod-brita.jpg",
      "highlights": ["Obras em geral", "Bases e estruturas", "Entrega programada"]
    }
  ],
  "logistics": {
    "title": "Entrega & Logística",
    "description": "Temos entrega própria e atendimento para GO, TO e BA. Orçamento rápido e entrega conforme rota e disponibilidade.",
    "steps": [
      {"title": "1) Solicite o orçamento", "text": "Envie cidade/UF, produto e quantidade no WhatsApp."},
      {"title": "2) Confirmação e agendamento", "text": "Confirmamos valor, prazo e melhor janela de entrega."},
      {"title": "3) Entrega própria", "text": "Entregamos conforme rota e disponibilidade, com atendimento direto."}
    ]
  },
  "gallery": {
    "title": "Fotos & Vídeos",
    "description": "Adicione fotos reais da operação, carregamento, materiais e frota — isso aumenta muito a confiança do cliente.",
    "images": [
      "assets/img/galeria-01.jpg",
      "assets/img/galeria-02.jpg",
      "assets/img/galeria-03.jpg",
      "assets/img/galeria-04.jpg",
      "assets/img/galeria-05.jpg",
      "assets/img/galeria-06.jpg"
    ],
    "videos": [
      {"title": "Operação / Carregamento", "src": "assets/videos/video-01.mp4", "poster": "assets/img/video-01.jpg"},
      {"title": "Frota / Entrega", "src": "assets/videos/video-02.mp4", "poster": "assets/img/video-02.jpg"}
    ]
  },
  "testimonials": [
    {
      "name": "Cliente (exemplo)",
      "role": "Produtor / Empresa",
      "quote": "Atendimento rápido e entrega no prazo. Material com padrão e boa logística."
    },
    {
      "name": "Cliente (exemplo)",
      "role": "Construtora",
      "quote": "Boa organização no carregamento e comunicação clara. Recomendo."
    }
  ],
  "faq": [
    {
      "q": "Vocês entregam em quais estados?",
      "a": "Atendemos GO, TO e BA com entrega própria, conforme rota e disponibilidade."
    },
    {
      "q": "Como pedir orçamento rápido?",
      "a": "Chame no WhatsApp e informe cidade/UF, produto (calcário ou brita) e quantidade."
    },
    {
      "q": "Emitem nota fiscal?",
      "a": "Sim. Emitimos NF conforme o tipo de operação e dados fornecidos."
    }
  ],
  "contact": {
    "email": "SEUEMAIL@exemplo.com",
    "addressLine": "Campos Belos - GO",
    "mapEmbedUrl": "https://www.google.com/maps?q=Campos+Belos+GO&output=embed"
  },
  "legal": {
    "companyName": "JM Calcários",
    "year": 2026,
    "privacyNote": "Este site pode usar cookies essenciais para melhorar a experiência. Ao continuar, você concorda com a nossa política de privacidade."
  }
}
JSON

# -------------------------
# CSS
# -------------------------
cat > assets/css/styles.css <<'CSS'
:root{
  --bg: #0b1220;
  --bg2:#0f1a32;
  --card:#111c35;
  --text:#eaf0ff;
  --muted:#b6c2e2;
  --line: rgba(255,255,255,.10);
  --brand:#59d18a;
  --brand2:#63a5ff;
  --warn:#ffcc66;
  --shadow: 0 14px 40px rgba(0,0,0,.35);
  --radius: 18px;
  --radius2: 26px;
  --max: 1180px;
  --font: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Arial;
}
*{ box-sizing:border-box; }
html,body{ margin:0; padding:0; font-family:var(--font); background: radial-gradient(1200px 700px at 20% 10%, #14254a 0%, var(--bg) 55%, #070b14 100%); color:var(--text); }
a{ color:inherit; text-decoration:none; }
img,video{ max-width:100%; display:block; }
.container{ width:min(var(--max), calc(100% - 40px)); margin:0 auto; }
.grid{ display:grid; gap:18px; }
.hidden{ display:none !important; }

/* Header */
header{
  position:sticky; top:0; z-index:50;
  backdrop-filter: blur(10px);
  background: linear-gradient(to bottom, rgba(11,18,32,.85), rgba(11,18,32,.55));
  border-bottom: 1px solid var(--line);
}
.nav{
  display:flex; align-items:center; justify-content:space-between;
  padding:14px 0;
}
.brand{
  display:flex; align-items:center; gap:12px;
}
.brand .logo{
  width:44px; height:44px; border-radius:14px;
  background: rgba(255,255,255,.06);
  border:1px solid var(--line);
  overflow:hidden;
}
.brand .logo img{ width:100%; height:100%; object-fit:cover; }
.brand .text{ display:flex; flex-direction:column; line-height:1.1; }
.brand .text strong{ font-size:15px; letter-spacing:.3px; }
.brand .text span{ font-size:12px; color:var(--muted); }

.menu{
  display:flex; align-items:center; gap:10px;
}
.menu a{
  padding:10px 12px; border-radius:12px;
  color:var(--muted);
  transition: .2s ease;
}
.menu a:hover{ background:rgba(255,255,255,.06); color:var(--text); }
.menu a.active{ background:rgba(89,209,138,.14); color:var(--text); border:1px solid rgba(89,209,138,.25); }

.actions{ display:flex; align-items:center; gap:10px; }
.btn{
  display:inline-flex; align-items:center; justify-content:center; gap:10px;
  padding:12px 14px; border-radius:14px;
  border:1px solid var(--line);
  background: rgba(255,255,255,.06);
  color:var(--text);
  cursor:pointer;
  transition:.2s ease;
  user-select:none;
}
.btn:hover{ transform: translateY(-1px); box-shadow: var(--shadow); background: rgba(255,255,255,.085); }
.btn.primary{
  border:1px solid rgba(89,209,138,.35);
  background: linear-gradient(135deg, rgba(89,209,138,.22), rgba(99,165,255,.14));
}
.btn.ghost{
  background: transparent;
}
.btn.small{ padding:10px 12px; border-radius:12px; font-size:14px; }
.badge{
  display:inline-flex; align-items:center; gap:8px;
  font-size:12px; color:var(--muted);
  border:1px solid var(--line);
  background: rgba(255,255,255,.05);
  padding:8px 10px; border-radius:999px;
}

/* Mobile nav */
.hamburger{ display:none; }
.mobile-drawer{
  position:fixed; inset:0; background: rgba(0,0,0,.55);
  backdrop-filter: blur(6px);
  z-index:100;
}
.drawer{
  position:absolute; right:0; top:0; height:100%; width:min(92vw, 360px);
  background: linear-gradient(180deg, rgba(17,28,53,.98), rgba(11,18,32,.98));
  border-left:1px solid var(--line);
  padding:18px;
  display:flex; flex-direction:column; gap:10px;
}
.drawer a{ padding:12px 12px; border-radius:14px; color:var(--muted); border:1px solid transparent; }
.drawer a:hover{ background:rgba(255,255,255,.06); color:var(--text); }
.drawer a.active{ background:rgba(89,209,138,.14); border:1px solid rgba(89,209,138,.25); color:var(--text); }
.drawer .top{ display:flex; align-items:center; justify-content:space-between; }
.icon-btn{
  border:1px solid var(--line);
  background: rgba(255,255,255,.06);
  color:var(--text);
  border-radius:14px;
  padding:10px 12px;
  cursor:pointer;
}

/* Hero */
.hero{
  padding: 44px 0 18px;
}
.hero-inner{
  display:grid;
  grid-template-columns: 1.2fr .8fr;
  gap:18px;
  align-items:stretch;
}
.hero-card{
  border:1px solid var(--line);
  background: linear-gradient(180deg, rgba(255,255,255,.06), rgba(255,255,255,.03));
  border-radius: var(--radius2);
  padding:22px;
  box-shadow: var(--shadow);
  overflow:hidden;
  position:relative;
}
.hero-card h1{
  margin:0 0 10px;
  font-size: clamp(28px, 3.8vw, 44px);
  letter-spacing:-.6px;
}
.hero-card p{ margin:0 0 16px; color:var(--muted); font-size:16px; line-height:1.6; }
.hero-ctas{ display:flex; gap:12px; flex-wrap:wrap; }
.hero-meta{ display:flex; gap:10px; flex-wrap:wrap; margin-top:18px; }

.media-card{
  border:1px solid var(--line);
  background: linear-gradient(180deg, rgba(255,255,255,.06), rgba(255,255,255,.03));
  border-radius: var(--radius2);
  overflow:hidden;
  box-shadow: var(--shadow);
  position:relative;
}
.media-card .media{
  position:relative;
  height:100%;
  min-height: 320px;
  background: rgba(0,0,0,.25);
}
.media-card .media img,
.media-card .media video{
  width:100%; height:100%;
  object-fit:cover;
}
.media-card .overlay{
  position:absolute; inset:auto 16px 16px 16px;
  display:flex; flex-direction:column; gap:8px;
}
.kpis{
  display:grid;
  grid-template-columns: repeat(2, minmax(0,1fr));
  gap:12px;
}
.kpi{
  padding:14px;
  border-radius:18px;
  border:1px solid var(--line);
  background: rgba(0,0,0,.20);
}
.kpi strong{ display:block; font-size:18px; }
.kpi span{ color:var(--muted); font-size:13px; }

/* Sections */
section{ padding: 26px 0; }
.section-title{
  display:flex; align-items:flex-end; justify-content:space-between;
  gap:12px; margin-bottom: 14px;
}
.section-title h2{ margin:0; font-size:22px; letter-spacing:-.3px; }
.section-title p{ margin:0; color:var(--muted); max-width: 620px; }

.cards{ display:grid; grid-template-columns: repeat(3, minmax(0,1fr)); gap:14px; }
.card{
  border:1px solid var(--line);
  background: linear-gradient(180deg, rgba(255,255,255,.06), rgba(255,255,255,.03));
  border-radius: var(--radius);
  overflow:hidden;
  box-shadow: var(--shadow);
}
.card .pad{ padding:16px; }
.card h3{ margin:0 0 8px; font-size:18px; }
.card p{ margin:0; color:var(--muted); line-height:1.6; }
.card .thumb{ height:170px; background: rgba(0,0,0,.18); }
.card .thumb img{ width:100%; height:100%; object-fit:cover; }
.list{
  margin:12px 0 0; padding:0 0 0 18px; color:var(--muted);
}
.list li{ margin:6px 0; }

.split{
  display:grid;
  grid-template-columns: 1fr 1fr;
  gap:14px;
}
.panel{
  border:1px solid var(--line);
  background: linear-gradient(180deg, rgba(255,255,255,.06), rgba(255,255,255,.03));
  border-radius: var(--radius2);
  padding:18px;
  box-shadow: var(--shadow);
}
.panel h3{ margin:0 0 10px; font-size:18px; }
.panel p{ margin:0; color:var(--muted); line-height:1.7; }

/* Gallery */
.gallery{
  display:grid;
  grid-template-columns: repeat(6, minmax(0,1fr));
  gap:10px;
}
.gallery button{
  border:1px solid var(--line);
  background: rgba(255,255,255,.05);
  border-radius: 16px;
  overflow:hidden;
  padding:0;
  cursor:pointer;
  transition:.2s ease;
}
.gallery button:hover{ transform: translateY(-1px); box-shadow: var(--shadow); }
.gallery img{ width:100%; height:120px; object-fit:cover; }

.video-grid{
  display:grid; grid-template-columns: repeat(2, minmax(0,1fr)); gap:12px;
}
.video-card{
  border:1px solid var(--line);
  background: rgba(255,255,255,.05);
  border-radius: var(--radius2);
  overflow:hidden;
  box-shadow: var(--shadow);
}
.video-card video{ width:100%; height:260px; object-fit:cover; background:#000; }
.video-card .pad{ padding:14px; }
.video-card strong{ display:block; margin-bottom:4px; }
.video-card span{ color:var(--muted); font-size:13px; }

/* FAQ */
.faq{
  display:grid; grid-template-columns: 1fr; gap:10px;
}
.faq details{
  border:1px solid var(--line);
  background: rgba(255,255,255,.05);
  border-radius: 18px;
  padding: 12px 14px;
}
.faq summary{
  cursor:pointer;
  list-style:none;
  display:flex; align-items:center; justify-content:space-between;
  gap:10px;
  font-weight:600;
}
.faq summary::-webkit-details-marker{ display:none; }
.faq .ans{ margin-top:10px; color:var(--muted); line-height:1.7; }

/* Forms */
form{ display:grid; gap:10px; }
.field{ display:grid; gap:6px; }
label{ font-size:13px; color:var(--muted); }
input, select, textarea{
  padding:12px 12px;
  border-radius:14px;
  border:1px solid var(--line);
  background: rgba(0,0,0,.25);
  color: var(--text);
  outline:none;
}
textarea{ min-height:110px; resize:vertical; }
.form-row{
  display:grid; grid-template-columns: 1fr 1fr; gap:10px;
}
.helper{ font-size:12px; color:var(--muted); }

.map{
  border-radius: var(--radius2);
  overflow:hidden;
  border:1px solid var(--line);
  height: 360px;
}
.map iframe{ width:100%; height:100%; border:0; }

/* Footer */
footer{
  padding: 22px 0 34px;
  border-top: 1px solid var(--line);
  color: var(--muted);
}
.footer-grid{
  display:grid;
  grid-template-columns: 1.3fr .7fr .7fr;
  gap:14px;
}
.footer-grid strong{ color: var(--text); }
.small{ font-size:12px; line-height:1.6; }

/* WhatsApp floating button */
.wa-float{
  position:fixed;
  right: 18px;
  bottom: 18px;
  z-index: 120;
  display:flex; align-items:center; gap:10px;
}
.wa-float a{
  display:inline-flex; align-items:center; gap:10px;
  padding: 12px 14px;
  border-radius: 999px;
  background: linear-gradient(135deg, rgba(89,209,138,.26), rgba(89,209,138,.16));
  border:1px solid rgba(89,209,138,.35);
  box-shadow: var(--shadow);
}
.wa-float .dot{
  width:10px; height:10px; border-radius:50%;
  background: var(--brand);
  box-shadow: 0 0 0 8px rgba(89,209,138,.12);
}
.wa-float small{ display:block; color: var(--muted); }

/* Modal */
.modal{
  position:fixed; inset:0; background: rgba(0,0,0,.7);
  display:flex; align-items:center; justify-content:center;
  z-index: 200;
  padding: 22px;
}
.modal .inner{
  width:min(980px, 100%);
  border-radius: var(--radius2);
  overflow:hidden;
  border:1px solid var(--line);
  background: rgba(10,14,26,.98);
  box-shadow: var(--shadow);
}
.modal .top{
  display:flex; align-items:center; justify-content:space-between;
  padding: 12px 14px;
  border-bottom:1px solid var(--line);
}
.modal .body{ padding: 0; }
.modal img{ width:100%; height: min(72vh, 620px); object-fit:contain; background:#05070d; }
.modal .close{
  border:1px solid var(--line);
  background: rgba(255,255,255,.06);
  color: var(--text);
  border-radius: 14px;
  padding: 10px 12px;
  cursor:pointer;
}

/* Cookie */
.cookie{
  position:fixed; left:18px; bottom:18px;
  width:min(520px, calc(100% - 36px));
  z-index: 130;
  border:1px solid var(--line);
  background: rgba(10,14,26,.96);
  border-radius: var(--radius2);
  box-shadow: var(--shadow);
  padding: 14px;
}
.cookie p{ margin:0 0 10px; color: var(--muted); line-height:1.6; }
.cookie .row{ display:flex; gap:10px; flex-wrap:wrap; }

@media (max-width: 980px){
  .hero-inner{ grid-template-columns: 1fr; }
  .media-card .media{ min-height: 260px; }
  .cards{ grid-template-columns: 1fr; }
  .split{ grid-template-columns: 1fr; }
  .gallery{ grid-template-columns: repeat(3, minmax(0,1fr)); }
  .video-grid{ grid-template-columns: 1fr; }
  .footer-grid{ grid-template-columns: 1fr; }
  .menu{ display:none; }
  .hamburger{ display:inline-flex; }
}
CSS

# -------------------------
# JS (shared)
# -------------------------
cat > assets/js/content.js <<'JS'
async function loadSiteContent() {
  const res = await fetch("assets/data/content.json", { cache: "no-store" });
  if (!res.ok) throw new Error("Falha ao carregar content.json");
  return await res.json();
}

function waLink(e164) {
  return `https://wa.me/${e164}`;
}

function setText(id, text) {
  const el = document.getElementById(id);
  if (el) el.textContent = text ?? "";
}

function setHTML(id, html) {
  const el = document.getElementById(id);
  if (el) el.innerHTML = html ?? "";
}

function setAttr(id, attr, value) {
  const el = document.getElementById(id);
  if (el && value) el.setAttribute(attr, value);
}

function markActiveNav() {
  const path = (location.pathname.split("/").pop() || "index.html").toLowerCase();
  document.querySelectorAll('[data-nav]').forEach(a => {
    const href = (a.getAttribute("href") || "").toLowerCase();
    if (href.endsWith(path)) a.classList.add("active");
  });
}

function fmtAreas(arr) {
  if (!Array.isArray(arr) || arr.length === 0) return "";
  return arr.join(" • ");
}

function escapeHtml(s="") {
  return String(s).replace(/[&<>"']/g, m => ({
    "&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#039;"
  })[m]);
}

export { loadSiteContent, waLink, setText, setHTML, setAttr, markActiveNav, fmtAreas, escapeHtml };
JS

cat > assets/js/main.js <<'JS'
import { loadSiteContent, waLink, setText, setHTML, setAttr, markActiveNav, fmtAreas, escapeHtml } from "./content.js";

function setupMobileNav() {
  const openBtn = document.getElementById("btnOpenNav");
  const drawer = document.getElementById("mobileNav");
  const closeBtn = document.getElementById("btnCloseNav");
  const inner = document.getElementById("drawerInner");

  function open() { drawer?.classList.remove("hidden"); }
  function close() { drawer?.classList.add("hidden"); }

  openBtn?.addEventListener("click", open);
  closeBtn?.addEventListener("click", close);
  drawer?.addEventListener("click", (e) => {
    if (e.target === drawer) close();
  });
  inner?.addEventListener("click", (e) => {
    const a = e.target.closest("a");
    if (a) close();
  });

  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") close();
  });
}

function setupGalleryModal() {
  const modal = document.getElementById("modal");
  const modalImg = document.getElementById("modalImg");
  const btnClose = document.getElementById("modalClose");

  function open(src, alt="") {
    if (!modal || !modalImg) return;
    modalImg.src = src;
    modalImg.alt = alt;
    modal.classList.remove("hidden");
    document.body.style.overflow = "hidden";
  }
  function close() {
    if (!modal) return;
    modal.classList.add("hidden");
    document.body.style.overflow = "";
  }

  btnClose?.addEventListener("click", close);
  modal?.addEventListener("click", (e) => { if (e.target === modal) close(); });
  document.addEventListener("keydown", (e) => { if (e.key === "Escape") close(); });

  return { open, close };
}

function setupCookie(content) {
  const box = document.getElementById("cookie");
  const txt = document.getElementById("cookieText");
  const ok = document.getElementById("cookieOk");
  const key = "jmcalcarios_cookie_ok_v1";

  if (!box || !txt || !ok) return;

  txt.textContent = content?.legal?.privacyNote ?? "";
  if (localStorage.getItem(key) === "1") {
    box.classList.add("hidden");
    return;
  }
  ok.addEventListener("click", () => {
    localStorage.setItem(key, "1");
    box.classList.add("hidden");
  });
}

function applySEO(content, pageTitleSuffix = "") {
  const brand = content.brand?.name ?? "JM Calcários";
  const baseTitle = content.seo?.defaultTitle ?? brand;
  const desc = content.seo?.defaultDescription ?? "";
  const kw = (content.seo?.keywords ?? []).join(", ");

  const title = pageTitleSuffix ? `${pageTitleSuffix} | ${brand}` : baseTitle;
  document.title = title;

  const metaDesc = document.querySelector('meta[name="description"]');
  if (metaDesc) metaDesc.setAttribute("content", desc);

  const metaKw = document.querySelector('meta[name="keywords"]');
  if (metaKw) metaKw.setAttribute("content", kw);

  const ogTitle = document.querySelector('meta[property="og:title"]');
  if (ogTitle) ogTitle.setAttribute("content", title);

  const ogDesc = document.querySelector('meta[property="og:description"]');
  if (ogDesc) ogDesc.setAttribute("content", desc);

  const ogSite = document.querySelector('meta[property="og:site_name"]');
  if (ogSite) ogSite.setAttribute("content", brand);
}

async function initCommon() {
  const content = await loadSiteContent();
  markActiveNav();
  setupMobileNav();
  setupCookie(content);

  // Header/brand
  setText("brandName", content.brand?.name);
  setText("brandTagline", content.brand?.tagline);
  setAttr("brandLogo", "src", content.brand?.logoPath);
  setAttr("brandLogo", "alt", content.brand?.name);
  setAttr("brandFavicon", "href", content.brand?.faviconPath);

  // Footer
  setText("footerBrand", content.brand?.name);
  setText("footerCity", content.brand?.city);
  setText("footerAreas", fmtAreas(content.brand?.serviceAreas));
  setText("footerYear", String(content.legal?.year ?? new Date().getFullYear()));
  setText("footerCompany", content.legal?.companyName ?? content.brand?.name);

  // WhatsApp
  const e164 = content.brand?.whatsappNumberE164;
  const wa = waLink(e164);
  document.querySelectorAll("[data-wa]").forEach(a => a.setAttribute("href", wa));
  document.querySelectorAll("[data-wa-display]").forEach(el => el.textContent = content.brand?.whatsappDisplay ?? "");

  return content;
}

async function initHome() {
  const content = await initCommon();
  applySEO(content);

  const brand = content.brand?.name ?? "JM Calcários";
  const hero = content.hero ?? {};

  setText("heroHeadline", hero.headline);
  setText("heroSubheadline", hero.subheadline);

  setText("kpiCity", content.brand?.city ?? "");
  setText("kpiAreas", fmtAreas(content.brand?.serviceAreas ?? []));

  // Hero CTA labels
  setText("heroCtaPrimaryText", hero.primaryCtaText ?? "Pedir orçamento");
  setText("heroCtaSecondaryText", hero.secondaryCtaText ?? "Ver produtos");

  // Hero media: prefer video if exists and allowed
  const mediaImg = document.getElementById("heroImg");
  const mediaVid = document.getElementById("heroVideo");
  const useVideo = Boolean(hero.useVideoIfAvailable && hero.heroVideo);

  if (useVideo && mediaVid) {
    mediaVid.src = hero.heroVideo;
    mediaVid.classList.remove("hidden");
    mediaImg?.classList.add("hidden");
  } else {
    if (mediaImg) mediaImg.src = hero.heroImage || "assets/img/hero.jpg";
    mediaImg?.classList.remove("hidden");
    mediaVid?.classList.add("hidden");
  }

  // Products cards
  const products = Array.isArray(content.products) ? content.products : [];
  const prodWrap = document.getElementById("productsCards");
  if (prodWrap) {
    prodWrap.innerHTML = products.map(p => `
      <article class="card">
        <div class="thumb"><img src="${escapeHtml(p.image || "")}" alt="${escapeHtml(p.name || "")}"></div>
        <div class="pad">
          <h3>${escapeHtml(p.name || "")}</h3>
          <p>${escapeHtml(p.description || "")}</p>
          ${Array.isArray(p.highlights) && p.highlights.length ? `<ul class="list">${p.highlights.map(x => `<li>${escapeHtml(x)}</li>`).join("")}</ul>` : ""}
        </div>
      </article>
    `).join("");
  }

  // Logistics steps
  const stepsWrap = document.getElementById("logSteps");
  if (stepsWrap) {
    const steps = content.logistics?.steps ?? [];
    stepsWrap.innerHTML = steps.map(s => `
      <div class="panel">
        <h3>${escapeHtml(s.title || "")}</h3>
        <p>${escapeHtml(s.text || "")}</p>
      </div>
    `).join("");
  }

  // Testimonials
  const tWrap = document.getElementById("testimonials");
  if (tWrap) {
    const items = content.testimonials ?? [];
    tWrap.innerHTML = items.map(t => `
      <article class="card">
        <div class="pad">
          <h3>${escapeHtml(t.name || "")}</h3>
          <p class="helper">${escapeHtml(t.role || "")}</p>
          <p style="margin-top:10px;">“${escapeHtml(t.quote || "")}”</p>
        </div>
      </article>
    `).join("");
  }

  // FAQ
  const faqWrap = document.getElementById("faq");
  if (faqWrap) {
    const faq = content.faq ?? [];
    faqWrap.innerHTML = faq.map(item => `
      <details>
        <summary>${escapeHtml(item.q || "")} <span class="badge">Abrir</span></summary>
        <div class="ans">${escapeHtml(item.a || "")}</div>
      </details>
    `).join("");
  }

  // Gallery
  const gal = content.gallery ?? {};
  const modal = setupGalleryModal();
  const gWrap = document.getElementById("gallery");
  if (gWrap) {
    const imgs = gal.images ?? [];
    gWrap.innerHTML = imgs.map((src, i) => `
      <button type="button" aria-label="Abrir imagem ${i+1}" data-img="${escapeHtml(src)}">
        <img src="${escapeHtml(src)}" alt="Galeria ${i+1}">
      </button>
    `).join("");
    gWrap.querySelectorAll("button[data-img]").forEach(btn => {
      btn.addEventListener("click", () => modal?.open(btn.getAttribute("data-img"), "Imagem da galeria"));
    });
  }

  // Videos
  const vWrap = document.getElementById("videos");
  if (vWrap) {
    const vids = gal.videos ?? [];
    vWrap.innerHTML = vids.map(v => `
      <div class="video-card">
        <video controls preload="metadata" poster="${escapeHtml(v.poster || "")}">
          <source src="${escapeHtml(v.src || "")}" type="video/mp4">
          Seu navegador não suporta vídeo.
        </video>
        <div class="pad">
          <strong>${escapeHtml(v.title || "Vídeo")}</strong>
          <span>Substitua os arquivos em /assets/videos</span>
        </div>
      </div>
    `).join("");
  }

  // Quick quote form -> sends to WhatsApp
  const form = document.getElementById("quoteForm");
  form?.addEventListener("submit", (e) => {
    e.preventDefault();
    const fd = new FormData(form);
    const nome = fd.get("nome") || "";
    const cidade = fd.get("cidade") || "";
    const produto = fd.get("produto") || "";
    const qtd = fd.get("quantidade") || "";
    const msg = `Olá, ${brand}! Quero orçamento.%0A%0ANome: ${encodeURIComponent(nome)}%0ACidade/UF: ${encodeURIComponent(cidade)}%0AProduto: ${encodeURIComponent(produto)}%0AQuantidade: ${encodeURIComponent(qtd)}%0A`;
    window.open(`${waLink(content.brand.whatsappNumberE164)}?text=${msg}`, "_blank");
  });
}

async function initProducts() {
  const content = await initCommon();
  applySEO(content, "Produtos");

  const wrap = document.getElementById("productsList");
  const products = content.products ?? [];
  if (wrap) {
    wrap.innerHTML = products.map(p => `
      <article class="panel">
        <div class="grid" style="grid-template-columns: 1fr 1fr; gap:14px; align-items:center;">
          <div>
            <h3 style="margin:0 0 10px;">${escapeHtml(p.name || "")}</h3>
            <p>${escapeHtml(p.description || "")}</p>
            ${Array.isArray(p.highlights) && p.highlights.length ? `<ul class="list">${p.highlights.map(x => `<li>${escapeHtml(x)}</li>`).join("")}</ul>` : ""}
            <div style="margin-top:12px; display:flex; gap:10px; flex-wrap:wrap;">
              <a class="btn primary" data-wa href="#">Pedir orçamento</a>
              <a class="btn" href="contato.html">Falar com a equipe</a>
            </div>
          </div>
          <div class="card" style="overflow:hidden;">
            <div class="thumb" style="height:320px;">
              <img src="${escapeHtml(p.image || "")}" alt="${escapeHtml(p.name || "")}">
            </div>
          </div>
        </div>
      </article>
    `).join("");
  }
}

async function initLogistics() {
  const content = await initCommon();
  applySEO(content, "Entrega & Regiões");

  setText("logTitle", content.logistics?.title);
  setText("logDesc", content.logistics?.description);

  const stepsWrap = document.getElementById("steps");
  const steps = content.logistics?.steps ?? [];
  if (stepsWrap) {
    stepsWrap.innerHTML = steps.map(s => `
      <div class="panel">
        <h3>${escapeHtml(s.title || "")}</h3>
        <p>${escapeHtml(s.text || "")}</p>
      </div>
    `).join("");
  }

  setText("areas", fmtAreas(content.brand?.serviceAreas ?? []));
}

async function initAbout() {
  const content = await initCommon();
  applySEO(content, "A Empresa");

  setText("aboutBrand", content.brand?.name);
  setText("aboutCity", content.brand?.city);
  setText("aboutAreas", fmtAreas(content.brand?.serviceAreas ?? []));

  // gallery preview on about
  const wrap = document.getElementById("aboutGallery");
  const modal = setupGalleryModal();
  const imgs = content.gallery?.images ?? [];
  if (wrap) {
    wrap.innerHTML = imgs.slice(0, 6).map((src, i) => `
      <button type="button" aria-label="Abrir imagem ${i+1}" data-img="${escapeHtml(src)}">
        <img src="${escapeHtml(src)}" alt="Galeria ${i+1}">
      </button>
    `).join("");
    wrap.querySelectorAll("button[data-img]").forEach(btn => {
      btn.addEventListener("click", () => modal?.open(btn.getAttribute("data-img"), "Imagem da galeria"));
    });
  }
}

async function initContact() {
  const content = await initCommon();
  applySEO(content, "Contato & Orçamento");

  setText("contactCity", content.brand?.city);
  setText("contactAreas", fmtAreas(content.brand?.serviceAreas ?? []));
  setText("contactEmail", content.contact?.email ?? "");
  setAttr("map", "src", content.contact?.mapEmbedUrl ?? "");

  // Contact form -> WhatsApp
  const form = document.getElementById("contactForm");
  form?.addEventListener("submit", (e) => {
    e.preventDefault();
    const fd = new FormData(form);
    const nome = fd.get("nome") || "";
    const tel = fd.get("telefone") || "";
    const cidade = fd.get("cidade") || "";
    const produto = fd.get("produto") || "";
    const qtd = fd.get("quantidade") || "";
    const msg = fd.get("mensagem") || "";

    const text =
      `Olá! Quero falar com a JM Calcários.%0A%0A` +
      `Nome: ${encodeURIComponent(nome)}%0A` +
      `Telefone: ${encodeURIComponent(tel)}%0A` +
      `Cidade/UF: ${encodeURIComponent(cidade)}%0A` +
      `Produto: ${encodeURIComponent(produto)}%0A` +
      `Quantidade: ${encodeURIComponent(qtd)}%0A` +
      `Mensagem: ${encodeURIComponent(msg)}%0A`;

    window.open(`${waLink(content.brand.whatsappNumberE164)}?text=${text}`, "_blank");
  });
}

// Router by body data-page
(async function(){
  const page = document.body.getAttribute("data-page") || "home";
  try{
    if (page === "home") await initHome();
    else if (page === "produtos") await initProducts();
    else if (page === "entrega") await initLogistics();
    else if (page === "empresa") await initAbout();
    else if (page === "contato") await initContact();
    else await initCommon();
  } catch (e) {
    console.error(e);
    const fallback = document.getElementById("fatal");
    if (fallback) {
      fallback.classList.remove("hidden");
      fallback.textContent = "Erro ao carregar o conteúdo do site. Verifique assets/data/content.json";
    }
  }
})();
JS

# -------------------------
# HTML templates (shared chunks inserted per page)
# -------------------------
cat > _partials_header.html <<'HTML'
<header>
  <div class="container nav">
    <a class="brand" href="index.html" aria-label="Ir para página inicial">
      <span class="logo"><img id="brandLogo" src="assets/img/logo.png" alt="Logo"></span>
      <span class="text">
        <strong id="brandName">JM Calcários</strong>
        <span id="brandTagline">Calcário agrícola e britas com entrega própria</span>
      </span>
    </a>

    <nav class="menu" aria-label="Menu principal">
      <a data-nav href="index.html">Início</a>
      <a data-nav href="produtos.html">Produtos</a>
      <a data-nav href="entrega.html">Entrega & Regiões</a>
      <a data-nav href="empresa.html">A Empresa</a>
      <a data-nav href="contato.html">Contato</a>
    </nav>

    <div class="actions">
      <a class="btn primary" data-wa href="#" aria-label="Pedir orçamento no WhatsApp">
        <span>WhatsApp</span>
        <span class="badge" data-wa-display>+55 (62) 9640-5492</span>
      </a>

      <button id="btnOpenNav" class="btn small hamburger" type="button" aria-label="Abrir menu">
        ☰
      </button>
    </div>
  </div>
</header>

<div id="mobileNav" class="mobile-drawer hidden" aria-hidden="true">
  <div class="drawer" id="drawerInner" role="dialog" aria-label="Menu">
    <div class="top">
      <span class="badge">Menu</span>
      <button id="btnCloseNav" class="icon-btn" type="button" aria-label="Fechar menu">✕</button>
    </div>
    <a data-nav href="index.html">Início</a>
    <a data-nav href="produtos.html">Produtos</a>
    <a data-nav href="entrega.html">Entrega & Regiões</a>
    <a data-nav href="empresa.html">A Empresa</a>
    <a data-nav href="contato.html">Contato</a>
    <div style="margin-top:10px;">
      <a class="btn primary" data-wa href="#">Pedir orçamento no WhatsApp</a>
    </div>
  </div>
</div>
HTML

cat > _partials_footer.html <<'HTML'
<footer>
  <div class="container footer-grid">
    <div>
      <strong id="footerBrand">JM Calcários</strong>
      <p class="small" style="margin:8px 0 0;">
        <span id="footerCity">Campos Belos - GO</span><br>
        Atendemos: <span id="footerAreas">GO • TO • BA</span><br>
        WhatsApp: <span data-wa-display>+55 (62) 9640-5492</span>
      </p>
    </div>
    <div>
      <strong>Atalhos</strong>
      <p class="small" style="margin:8px 0 0; display:grid; gap:6px;">
        <a href="produtos.html">Produtos</a>
        <a href="entrega.html">Entrega & Regiões</a>
        <a href="empresa.html">A Empresa</a>
        <a href="contato.html">Contato</a>
      </p>
    </div>
    <div>
      <strong>Orçamento rápido</strong>
      <p class="small" style="margin:8px 0 0;">
        Clique no botão do WhatsApp e envie: <br>
        <em>Cidade/UF • Produto • Quantidade</em>
      </p>
      <p class="small" style="margin:10px 0 0;">
        © <span id="footerYear">2026</span> <span id="footerCompany">JM Calcários</span>.
      </p>
    </div>
  </div>
</footer>

<div class="wa-float" aria-label="Atalho do WhatsApp">
  <a data-wa href="#">
    <span class="dot" aria-hidden="true"></span>
    <div>
      <strong>Orçamento no WhatsApp</strong>
      <small data-wa-display>+55 (62) 9640-5492</small>
    </div>
  </a>
</div>

<div id="cookie" class="cookie">
  <p id="cookieText"></p>
  <div class="row">
    <button id="cookieOk" class="btn primary small" type="button">Ok, entendi</button>
    <a class="btn small" href="contato.html">Contato</a>
  </div>
</div>

<div id="modal" class="modal hidden" aria-hidden="true">
  <div class="inner">
    <div class="top">
      <span class="badge">Visualização</span>
      <button id="modalClose" class="close" type="button">Fechar</button>
    </div>
    <div class="body">
      <img id="modalImg" src="" alt="Imagem ampliada">
    </div>
  </div>
</div>
HTML

# -------------------------
# BASE HEAD (SEO + assets)
# -------------------------
cat > _base_head.html <<'HTML'
<!doctype html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link id="brandFavicon" rel="icon" href="assets/img/favicon.png" />
  <meta name="description" content="JM Calcários em Campos Belos - GO. Calcário agrícola e britas com entrega própria para GO, TO e BA. Orçamento rápido no WhatsApp." />
  <meta name="keywords" content="calcário agrícola, brita, Campos Belos, Goiás, Tocantins, Bahia, correção de solo, construção civil" />

  <meta property="og:type" content="website" />
  <meta property="og:title" content="JM Calcários" />
  <meta property="og:description" content="Calcário agrícola e britas com entrega própria para GO, TO e BA." />
  <meta property="og:site_name" content="JM Calcários" />

  <link rel="preload" href="assets/css/styles.css" as="style" />
  <link rel="stylesheet" href="assets/css/styles.css" />
</head>
HTML

# -------------------------
# PAGES
# -------------------------
make_page () {
  local file="$1"
  local body_attrs="$2"
  local title="$3"
  local main="$4"

  cat > "$file" <<HTML
$(cat _base_head.html)
<body $body_attrs>
  <div id="fatal" class="container hidden" style="padding:14px; margin-top:14px; border:1px solid rgba(255,80,80,.35); border-radius:18px; background: rgba(255,80,80,.12);"></div>
  $(cat _partials_header.html)

  $main

  $(cat _partials_footer.html)

  <script type="module" src="assets/js/main.js"></script>
</body>
</html>
HTML
}

# Home main
HOME_MAIN=$(cat <<'HTML'
<main>
  <section class="hero">
    <div class="container hero-inner">
      <div class="hero-card">
        <div class="badge">Campos Belos - GO • <span id="kpiAreas">GO • TO • BA</span></div>
        <h1 id="heroHeadline">Calcário Agrícola e Britas com entrega própria</h1>
        <p id="heroSubheadline">Atendemos GO, TO e BA com agilidade, padrão de qualidade e atendimento rápido.</p>

        <div class="hero-ctas">
          <a class="btn primary" data-wa href="#" aria-label="Pedir orçamento no WhatsApp">
            <span id="heroCtaPrimaryText">Pedir orçamento no WhatsApp</span>
          </a>
          <a class="btn ghost" href="produtos.html" aria-label="Ver produtos">
            <span id="heroCtaSecondaryText">Ver produtos</span>
          </a>
        </div>

        <div class="hero-meta">
          <span class="badge">Entrega própria</span>
          <span class="badge">Atendimento rápido</span>
          <span class="badge">Agro e obras</span>
          <span class="badge">NF e organização comercial</span>
        </div>

        <div class="panel" style="margin-top:16px;">
          <h3 style="margin:0 0 8px;">Orçamento rápido (em 20 segundos)</h3>
          <p style="margin:0 0 12px;">Preencha e enviaremos direto no WhatsApp.</p>

          <form id="quoteForm">
            <div class="form-row">
              <div class="field">
                <label for="qnome">Nome</label>
                <input id="qnome" name="nome" placeholder="Seu nome" required />
              </div>
              <div class="field">
                <label for="qcidade">Cidade/UF</label>
                <input id="qcidade" name="cidade" placeholder="Ex.: Campos Belos/GO" required />
              </div>
            </div>

            <div class="form-row">
              <div class="field">
                <label for="qproduto">Produto</label>
                <select id="qproduto" name="produto" required>
                  <option value="" selected>Selecione</option>
                  <option>Calcário Agrícola</option>
                  <option>Britas</option>
                </select>
              </div>
              <div class="field">
                <label for="qqtd">Quantidade</label>
                <input id="qqtd" name="quantidade" placeholder="Ex.: 10 toneladas" required />
              </div>
            </div>

            <button class="btn primary" type="submit">Enviar no WhatsApp</button>
            <div class="helper">Dica: quanto mais detalhes, melhor (endereço, acesso, urgência).</div>
          </form>
        </div>
      </div>

      <div class="media-card">
        <div class="media">
          <img id="heroImg" src="assets/img/hero.jpg" alt="Operação JM Calcários">
          <video id="heroVideo" class="hidden" autoplay muted loop playsinline></video>

          <div class="overlay">
            <div class="kpis">
              <div class="kpi">
                <strong id="kpiCity">Campos Belos - GO</strong>
                <span>Base de operação</span>
              </div>
              <div class="kpi">
                <strong>GO • TO • BA</strong>
                <span>Regiões atendidas</span>
              </div>
              <div class="kpi">
                <strong>Entrega própria</strong>
                <span>Rotas e agendamento</span>
              </div>
              <div class="kpi">
                <strong>WhatsApp</strong>
                <span>Orçamento rápido</span>
              </div>
            </div>
          </div>

        </div>
      </div>

    </div>
  </section>

  <section>
    <div class="container">
      <div class="section-title">
        <div>
          <h2>Produtos</h2>
          <p>Fornecemos calcário agrícola e britas com foco em qualidade, padrão e logística eficiente.</p>
        </div>
        <a class="btn" href="produtos.html">Ver detalhes</a>
      </div>
      <div id="productsCards" class="cards"></div>
    </div>
  </section>

  <section>
    <div class="container">
      <div class="section-title">
        <div>
          <h2>Entrega & Logística</h2>
          <p>Fluxo simples, direto e rápido — do orçamento à entrega.</p>
        </div>
        <a class="btn" href="entrega.html">Ver regiões</a>
      </div>
      <div id="logSteps" class="split"></div>
    </div>
  </section>

  <section>
    <div class="container">
      <div class="section-title">
        <div>
          <h2>Fotos & Vídeos</h2>
          <p>Substitua as imagens/vídeos pelos seus arquivos reais para deixar o site com cara 100% profissional.</p>
        </div>
        <span class="badge">Clique para ampliar</span>
      </div>

      <div id="gallery" class="gallery"></div>

      <div style="height:14px;"></div>

      <div class="section-title">
        <div>
          <h2>Vídeos</h2>
          <p>Você pode colocar vídeos de carregamento, frota, pedreira/mineradora, etc.</p>
        </div>
      </div>
      <div id="videos" class="video-grid"></div>
    </div>
  </section>

  <section>
    <div class="container">
      <div class="section-title">
        <div>
          <h2>Depoimentos</h2>
          <p>Depoimentos reais aumentam muito a conversão — coloque 3 a 6.</p>
        </div>
      </div>
      <div id="testimonials" class="cards"></div>
    </div>
  </section>

  <section>
    <div class="container">
      <div class="section-title">
        <div>
          <h2>Perguntas Frequentes</h2>
          <p>Respostas rápidas para acelerar o fechamento.</p>
        </div>
      </div>
      <div id="faq" class="faq"></div>
    </div>
  </section>

  <section>
    <div class="container">
      <div class="panel">
        <div class="grid" style="grid-template-columns: 1.2fr .8fr; gap:14px; align-items:center;">
          <div>
            <h3 style="margin:0 0 8px;">Pronto para cotar?</h3>
            <p style="margin:0; color:var(--muted);">Clique no WhatsApp e envie: cidade/UF + produto + quantidade.</p>
          </div>
          <div style="display:flex; gap:10px; justify-content:flex-end; flex-wrap:wrap;">
            <a class="btn primary" data-wa href="#">Pedir orçamento</a>
            <a class="btn" href="contato.html">Contato</a>
          </div>
        </div>
      </div>
    </div>
  </section>

</main>
HTML
)

make_page "index.html" 'data-page="home"' "JM Calcários" "$HOME_MAIN"

# Produtos
PROD_MAIN=$(cat <<'HTML'
<main>
  <section>
    <div class="container">
      <div class="section-title">
        <div>
          <h2>Produtos</h2>
          <p>Detalhes de fornecimento e aplicação para o agro e para obras.</p>
        </div>
        <a class="btn primary" data-wa href="#">Pedir orçamento</a>
      </div>

      <div id="productsList" class="grid" style="gap:14px;"></div>

      <div class="panel" style="margin-top:14px;">
        <h3 style="margin:0 0 8px;">Quer que a página fique ainda mais técnica?</h3>
        <p style="margin:0; color:var(--muted);">
          Você pode adicionar aqui: análises, especificações, granulometria, embalagem/ensacamento, e fotos por tipo de produto.
        </p>
      </div>
    </div>
  </section>
</main>
HTML
)
make_page "produtos.html" 'data-page="produtos"' "Produtos | JM Calcários" "$PROD_MAIN"

# Entrega
ENT_MAIN=$(cat <<'HTML'
<main>
  <section>
    <div class="container">
      <div class="section-title">
        <div>
          <h2 id="logTitle">Entrega & Regiões</h2>
          <p id="logDesc">Temos entrega própria e atendemos GO, TO e BA conforme rota e disponibilidade.</p>
        </div>
        <a class="btn primary" data-wa href="#">Orçar agora</a>
      </div>

      <div class="split">
        <div class="panel">
          <h3>Estados atendidos</h3>
          <p style="margin:0; color:var(--muted);">Atendemos: <strong id="areas">GO • TO • BA</strong></p>
          <ul class="list">
            <li>Entrega própria (rotas e agendamento)</li>
            <li>Atendimento rápido via WhatsApp</li>
            <li>Organização de carregamento e logística</li>
          </ul>
        </div>
        <div class="panel">
          <h3>Dica para cotação rápida</h3>
          <p style="margin:0; color:var(--muted);">
            Envie no WhatsApp: <strong>Cidade/UF</strong>, <strong>Produto</strong> e <strong>Quantidade</strong>.
            Se possível, mande o endereço/uma referência.
          </p>
          <div style="margin-top:12px;">
            <a class="btn primary" data-wa href="#">Abrir WhatsApp</a>
          </div>
        </div>
      </div>

      <div style="height:14px;"></div>

      <div class="section-title">
        <div>
          <h2>Como funciona</h2>
          <p>Fluxo prático, sem burocracia.</p>
        </div>
      </div>
      <div id="steps" class="split"></div>
    </div>
  </section>
</main>
HTML
)
make_page "entrega.html" 'data-page="entrega"' "Entrega & Regiões | JM Calcários" "$ENT_MAIN"

# Empresa
EMP_MAIN=$(cat <<'HTML'
<main>
  <section>
    <div class="container">
      <div class="section-title">
        <div>
          <h2>A Empresa</h2>
          <p>Quem é a <strong id="aboutBrand">JM Calcários</strong> e como atendemos com padrão e eficiência.</p>
        </div>
        <a class="btn primary" data-wa href="#">Falar no WhatsApp</a>
      </div>

      <div class="split">
        <div class="panel">
          <h3>Base e atendimento</h3>
          <p>
            Sediada em <strong id="aboutCity">Campos Belos - GO</strong>, a JM Calcários atua no fornecimento de
            <strong>calcário agrícola</strong> e <strong>britas</strong>, com entrega própria para <strong id="aboutAreas">GO • TO • BA</strong>.
          </p>
          <ul class="list">
            <li>Atendimento direto e orçamento rápido</li>
            <li>Logística com entrega própria</li>
            <li>Fornecimento para agro e obras</li>
          </ul>
        </div>
        <div class="panel">
          <h3>O que colocar aqui (pra ficar “premium”)</h3>
          <p>
            ✅ Fotos da operação<br>
            ✅ Fotos do carregamento e materiais<br>
            ✅ Vídeos curtos de entrega/frota<br>
            ✅ Certificações/licenças e compromissos (se quiser publicar)
          </p>
          <div style="margin-top:12px; display:flex; gap:10px; flex-wrap:wrap;">
            <a class="btn" href="contato.html">Contato</a>
            <a class="btn primary" data-wa href="#">Orçar</a>
          </div>
        </div>
      </div>

      <div style="height:14px;"></div>

      <div class="section-title">
        <div>
          <h2>Galeria (prévia)</h2>
          <p>Clique para ampliar. Substitua pelos seus arquivos reais.</p>
        </div>
      </div>
      <div id="aboutGallery" class="gallery"></div>
    </div>
  </section>
</main>
HTML
)
make_page "empresa.html" 'data-page="empresa"' "A Empresa | JM Calcários" "$EMP_MAIN"

# Contato
CONT_MAIN=$(cat <<'HTML'
<main>
  <section>
    <div class="container">
      <div class="section-title">
        <div>
          <h2>Contato & Orçamento</h2>
          <p>Atendimento por WhatsApp com resposta rápida.</p>
        </div>
        <a class="btn primary" data-wa href="#">Abrir WhatsApp</a>
      </div>

      <div class="split">
        <div class="panel">
          <h3>Fale com a JM Calcários</h3>
          <p style="margin:0; color:var(--muted);">
            Base: <strong id="contactCity">Campos Belos - GO</strong><br>
            Atendemos: <strong id="contactAreas">GO • TO • BA</strong><br>
            WhatsApp: <strong data-wa-display>+55 (62) 9640-5492</strong><br>
            E-mail: <strong id="contactEmail">SEUEMAIL@exemplo.com</strong>
          </p>

          <div style="margin-top:12px; display:flex; gap:10px; flex-wrap:wrap;">
            <a class="btn primary" data-wa href="#">Pedir orçamento no WhatsApp</a>
            <a class="btn" href="produtos.html">Ver produtos</a>
          </div>

          <div style="height:14px;"></div>

          <h3>Formulário (envia no WhatsApp)</h3>
          <form id="contactForm">
            <div class="form-row">
              <div class="field">
                <label for="cnome">Nome</label>
                <input id="cnome" name="nome" placeholder="Seu nome" required />
              </div>
              <div class="field">
                <label for="ctel">Telefone</label>
                <input id="ctel" name="telefone" placeholder="(DDD) 9xxxx-xxxx" />
              </div>
            </div>

            <div class="form-row">
              <div class="field">
                <label for="ccidade">Cidade/UF</label>
                <input id="ccidade" name="cidade" placeholder="Ex.: Gurupi/TO" required />
              </div>
              <div class="field">
                <label for="cproduto">Produto</label>
                <select id="cproduto" name="produto" required>
                  <option value="" selected>Selecione</option>
                  <option>Calcário Agrícola</option>
                  <option>Britas</option>
                </select>
              </div>
            </div>

            <div class="field">
              <label for="cqtd">Quantidade</label>
              <input id="cqtd" name="quantidade" placeholder="Ex.: 20 toneladas" />
            </div>

            <div class="field">
              <label for="cmsg">Mensagem</label>
              <textarea id="cmsg" name="mensagem" placeholder="Endereço, referência, urgência, etc."></textarea>
            </div>

            <button class="btn primary" type="submit">Enviar no WhatsApp</button>
            <div class="helper">Esse formulário não salva dados no servidor; ele abre o WhatsApp com a mensagem pronta.</div>
          </form>
        </div>

        <div class="panel">
          <h3>Localização</h3>
          <div class="map">
            <iframe id="map" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
          </div>
          <div style="height:12px;"></div>
          <p class="small">
            Para colocar o mapa exato da empresa, substitua a URL em <code>assets/data/content.json</code> (campo <code>mapEmbedUrl</code>).
          </p>
        </div>
      </div>

    </div>
  </section>
</main>
HTML
)
make_page "contato.html" 'data-page="contato"' "Contato | JM Calcários" "$CONT_MAIN"

# -------------------------
# Placeholder assets
# -------------------------
cat > assets/img/README.txt <<'TXT'
Coloque aqui:
- logo.png (logo da empresa)
- favicon.png (ícone do site)
- hero.jpg (foto grande para o banner)
- prod-calcario.jpg / prod-brita.jpg (imagens de produtos)
- galeria-01.jpg ... galeria-06.jpg
- video-01.jpg / video-02.jpg (posters dos vídeos)

Dica: use fotos reais (celular) com boa iluminação.
TXT

cat > assets/videos/README.txt <<'TXT'
Coloque aqui:
- hero.mp4 (opcional: vídeo do banner)
- video-01.mp4 / video-02.mp4 (vídeos da galeria)

Se não quiser vídeo no banner, mude:
"hero.useVideoIfAvailable": false
no assets/data/content.json
TXT

# clean up partials
rm -f _partials_header.html _partials_footer.html _base_head.html

echo "✅ Site criado em: $ROOT"
echo "Para rodar local:"
echo "  python3 -m http.server 8000"
echo "Depois abra: http://localhost:8000"
