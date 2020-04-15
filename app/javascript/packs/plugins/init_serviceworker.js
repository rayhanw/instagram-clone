export default () => {
  if (navigator.serviceWorker) {
    navigator.serviceWorker
      .register("/serviceworker.js", { scope: "./" })
      .then(() => {
        console.log("[Companion]", "Service worker registered!");
      });
  }
};
