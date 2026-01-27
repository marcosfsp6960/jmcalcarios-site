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
    const heroPoster = hero.heroImage || "assets/img/hero.jpg";
    mediaVid.src = hero.heroVideo;
    if (heroPoster) mediaVid.poster = heroPoster;
    mediaVid.classList.remove("hidden");
    mediaImg?.classList.add("hidden");

    const tryPlay = () => {
      const playPromise = mediaVid.play();
      if (playPromise && typeof playPromise.catch === "function") {
        playPromise.catch(() => {});
      }
    };

    tryPlay();

    const unlockPlayback = () => {
      tryPlay();
      window.removeEventListener("touchstart", unlockPlayback);
      window.removeEventListener("click", unlockPlayback);
      window.removeEventListener("scroll", unlockPlayback);
    };

    window.addEventListener("touchstart", unlockPlayback, { once: true, passive: true });
    window.addEventListener("click", unlockPlayback, { once: true });
    window.addEventListener("scroll", unlockPlayback, { once: true, passive: true });
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
