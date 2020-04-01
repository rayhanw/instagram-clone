import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["image"];

  connect() {
    console.log("Controller connected");
  }

  preview = event => {
    const { files } = event.target;
    if (files && files[0]) {
      const reader = new FileReader();

      reader.onload = readerEvent => {
        this.imageTarget.src = readerEvent.currentTarget.result;
      };

      reader.readAsDataURL(files[0]);
      this.imageTarget.classList.remove("hidden");
    }
  };
}
