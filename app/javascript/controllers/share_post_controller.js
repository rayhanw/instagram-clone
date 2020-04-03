import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["info"];

  async copy({ currentTarget }) {
    try {
      await navigator.clipboard.writeText(currentTarget.dataset.link);
      this.infoTarget.classList.remove("hidden");
      setTimeout(() => {
        this.infoTarget.classList.add("hidden");
      }, 2000);
    } catch (err) {
      console.log(err);
    }
  }
}
