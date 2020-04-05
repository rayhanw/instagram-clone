import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [
    "postContainer",
    "activityContainer",
    "activityToggler",
    "postToggler"
  ];

  change(event) {
    const clickedOn = event.currentTarget.dataset.name;

    if (clickedOn === "posts") {
      // Togglers
      this.postTogglerTarget.classList.add("border-b-2", "border-black");
      this.activityTogglerTarget.classList.remove("border-b-2", "border-black");
      // Containers
      this.postContainerTarget.classList.remove("hidden");
      this.activityContainerTarget.classList.add("hidden");
    } else {
      // Togglers
      this.activityTogglerTarget.classList.add("border-b-2", "border-black");
      this.postTogglerTarget.classList.remove("border-b-2", "border-black");
      // Containers
      this.activityContainerTarget.classList.remove("hidden");
      this.postContainerTarget.classList.add("hidden");
    }
  }
}
