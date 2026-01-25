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
