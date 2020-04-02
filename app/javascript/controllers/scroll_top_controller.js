import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["container"];

  scrollUp = () => {
    this.containerTarget.scrollTo(0, 0);
  };
}
