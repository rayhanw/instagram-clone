import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["spinner"];

  toggleSpinner() {
    this.spinnerTarget.classList.remove("hidden");
  }
}
