import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { test } from "node:test";
import { runInNewContext } from "node:vm";

test("TOC highlight follows each heading's scroll margin after navigation and scrolling", () => {
  const headings = [
    { title: "Previous chapter", top: -400, margin: 103.36 },
    { title: "Register", top: 103.25, margin: 103.36 },
    { title: "Subheading", top: 1000, margin: 79.04 },
  ];
  const links = headings.map((heading, i) => ({
    hash: `#heading-${i}`,
    textContent: heading.title,
    parentElement: { classList: new Set() },
  }));
  // Set has add/delete rather than the DOM's add/remove.
  for (const link of links) link.parentElement.classList.remove = link.parentElement.classList.delete;
  const runningHead = { textContent: "" };
  let scroll;
  const page = { addEventListener() {}, querySelector: () => runningHead };
  runInNewContext(readFileSync(new URL("static/reader.js", import.meta.url), "utf8"), {
    document: {
      querySelector: () => page,
      querySelectorAll: () => links,
      getElementById: (id) => {
        const heading = headings[Number(id.slice("heading-".length))];
        heading.getBoundingClientRect = () => ({ top: heading.top });
        return heading;
      },
      addEventListener: (_, listener) => { scroll = listener; },
    },
    window: { matchMedia: () => ({ matches: false }) },
    getComputedStyle: (heading) => ({ scrollMarginTop: `${heading.margin}px` }),
    requestAnimationFrame: (callback) => callback(),
  });
  const active = () => links.filter((link) => link.parentElement.classList.has("is-current"))
    .map((link) => link.textContent);
  assert.deepEqual(active(), ["Register"]);
  assert.equal(runningHead.textContent, "Register");

  headings[1].top = 105;
  scroll();
  assert.deepEqual(active(), ["Previous chapter"]);
  headings[1].top = -200;
  headings[2].top = 79.5; // Native anchor scrolling can round by a fraction of a pixel.
  scroll();
  assert.deepEqual(active(), ["Subheading"]);
  assert.equal(runningHead.textContent, "Subheading");

  headings[2].margin = 62;
  headings[2].top = 70;
  scroll();
  assert.deepEqual(active(), ["Register"]);
});
