import { Controller } from "stimulus";

export default class extends Controller {
  search(event) {
    console.log(event.target.value);
  }
}
