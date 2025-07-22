document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll("a[data-ref]").forEach(link => {
    const href = link.getAttribute("href") || "";
    if (href.includes("#sec-")) {
      link.removeAttribute("data-preview-path");
      link.removeAttribute("data-preview-title");
    }
  });
});
