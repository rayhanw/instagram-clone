import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["contentInput"];

  connect() {
    if (window.location.hash === "#comment_content") {
      this.focusOnInput();
    }
  }

  focusOnInput = () => {
    this.contentInputTarget.focus();
  };
}
