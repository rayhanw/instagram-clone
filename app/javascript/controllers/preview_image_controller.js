import { Controller } from "stimulus";
import { rotatePicture } from "../packs/plugins/init_exif";

export default class extends Controller {
  static targets = ["image"];

  preview = event => {
    const { files } = event.target;
    if (files && files[0]) {
      const reader = new FileReader();

      reader.onload = readerEvent => {
        this.imageTarget.src = readerEvent.currentTarget.result;
        rotatePicture(this.imageTarget, readerEvent);
      };

      reader.readAsDataURL(files[0]);
      this.imageTarget.classList.remove("hidden");
    }
  };
}
