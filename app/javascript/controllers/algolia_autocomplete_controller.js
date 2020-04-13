import { Controller } from "stimulus";
import algoliasearch from "algoliasearch";

const buildContent = ({ avatar_url, name, username }) => `
  <div class="mb-4">
    <a class="flex items-center" href="/users/${username}">
      <img src="${avatar_url}" alt="avatar" class="avatar object-cover" />
      <div class="ml-3">
        <h4 class="font-bold font-sans">${username}</h4>
        <span class="text-gray-700">${name}</span>
      </div>
    </a>
  </div>
`;

export default class extends Controller {
  connect() {
    this.client = algoliasearch(
      document.querySelector("meta[name='algolia-app-id']").content,
      document.querySelector("meta[name='algolia-search-only-api-key']").content
    );
    this.index = this.client.initIndex("User");
    this.options = { hitsPerPage: 8, page: 0 };
    this.container = document.querySelector(".users-container");
  }

  async search(event) {
    const response = await this.index.search(event.currentTarget.value);
    const cardContents = response.hits.map(buildContent);

    this.container.innerHTML = "";

    cardContents.forEach(content => {
      this.container.insertAdjacentHTML("beforeend", content);
    });
  }
}
