// Filters the collection in the page itself: the site is static, so search runs in the browser.
document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("catalog-filter");
  const query = document.getElementById("q");
  const topic = document.getElementById("topic");
  const kind = document.getElementById("kind");
  const rows = [...document.querySelectorAll(".work-row")];
  const count = document.getElementById("results-count");
  const heading = document.getElementById("results-heading");
  const empty = document.getElementById("no-results");
  const clear = document.getElementById("clear-filters");
  form.hidden = false;

  const params = new URLSearchParams(location.search);
  query.value = params.get("q") || "";
  topic.value = params.get("topic") || "";
  if (kind) kind.value = params.get("kind") || "";

  function apply() {
    const words = query.value.toLowerCase().split(/\s+/).filter(Boolean);
    let shown = 0;
    for (const row of rows) {
      const visible = words.every((w) => row.dataset.search.includes(w)) &&
        (!topic.value || row.dataset.topics.split(" ").includes(topic.value)) &&
        (!kind?.value || row.dataset.kind === kind.value);
      row.hidden = !visible;
      shown += visible;
    }
    count.textContent = `${shown} work${shown === 1 ? "" : "s"}`;
    heading.textContent = query.value.trim() ? `Results for “${query.value.trim()}”` : "Works";
    empty.hidden = shown > 0;
    clear.hidden = !query.value && !topic.value && !kind?.value;
    const next = new URLSearchParams();
    if (query.value) next.set("q", query.value);
    if (topic.value) next.set("topic", topic.value);
    if (kind?.value) next.set("kind", kind.value);
    history.replaceState(null, "", next.size ? `?${next}` : location.pathname);
  }
  form.addEventListener("submit", (event) => event.preventDefault());
  query.addEventListener("input", apply);
  topic.addEventListener("change", apply);
  kind?.addEventListener("change", apply);
  apply();
});
