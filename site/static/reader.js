// Progressive enhancement for the reader; the page works without it.
(() => {
  const page = document.querySelector(".book-page");
  if (!page) return;

  // Narrow screens have no margin: a footnote mark opens its note in place.
  const narrow = window.matchMedia("(max-width: 1119px)");
  page.addEventListener("click", (event) => {
    const link = event.target.closest(".footnote-mark a");
    if (!link || !narrow.matches) return;
    const note = link.parentElement.nextElementSibling;
    if (!note || !note.classList.contains("sidenote")) return;
    event.preventDefault();
    note.classList.toggle("is-open");
  });

  // Running head and contents follow the reading position.
  const entries = [...document.querySelectorAll(".book-toc a")].map((link) => ({
    item: link.parentElement,
    heading: document.getElementById(decodeURIComponent(link.hash.slice(1))),
    title: link.textContent.trim(),
  })).filter((entry) => entry.heading);
  const head = page.querySelector(".rh-section");
  if (!entries.length || !head) return;
  let current = null;
  let queued = false;
  const update = () => {
    queued = false;
    let found = null;
    for (const entry of entries) {
      if (entry.heading.getBoundingClientRect().top > 90) break;
      found = entry;
    }
    if (found === current) return;
    current?.item.classList.remove("is-current");
    found?.item.classList.add("is-current");
    found?.item.scrollIntoView?.({ block: "nearest" });
    head.textContent = found ? found.title : "";
    current = found;
  };
  document.addEventListener("scroll", () => {
    if (!queued) { queued = true; requestAnimationFrame(update); }
  }, { passive: true });
  update();
})();
