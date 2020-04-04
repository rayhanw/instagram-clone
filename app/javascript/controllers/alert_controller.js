import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["container"];

  close(event) {
    event.target.classList.add("hidden");
    this.containerTarget.scrollTop = this.containerTarget.scrollHeight;
  }
}
