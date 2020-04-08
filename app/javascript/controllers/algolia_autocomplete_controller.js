import { Controller } from "stimulus";
import algoliasearch from "algoliasearch";
import { insertContent } from "../utils";

export default class extends Controller {
  connect() {
    this.client = algoliasearch(
      document.querySelector("meta[name='algolia-app-id']").content,
      document.querySelector("meta[name='algolia-search-only-api-key']").content
    );
    this.index = this.client.initIndex("User");
    this.options = { hitsPerPage: 8, page: 0 };
  }

  async search(event) {
    const response = await this.index.search(event.currentTarget.value);
    response.hits.forEach(insertContent);
  }
}
