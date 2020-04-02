const postController = {
  container: document.querySelector(".container"),
  postsContainer: document.getElementById("posts-container"),
  moreBtn: document.getElementById("more-btn"),
  insertItems(items) {
    this.postsContainer.insertAdjacentHTML("beforeend", items);
  },
  setNextPage(nextPage) {
    const url = new URL(this.moreBtn.href);
    url.search = `?page=${nextPage}`;
    this.moreBtn.setAttribute("href", url.search);
  },
  attachInfiniteScroll() {
    if (this.moreBtn) {
      this.container.addEventListener("scroll", () => {
        if (
          this.container.scrollTop + this.container.clientHeight >=
          this.container.scrollHeight
        ) {
          this.moreBtn.click();
        }
      });
    }
  }
};

postController.attachInfiniteScroll();

global.postController = postController;
