import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["menu"];

  toggle = ({ currentTarget }) => {
    this.menuTarget.classList.toggle("hidden");
  };
}
