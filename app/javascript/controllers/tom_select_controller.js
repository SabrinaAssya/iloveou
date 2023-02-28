import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

export default class extends Controller {
  static values = {
    checkbox: Boolean
  }
  connect() {
    console.log("coucou")
    console.log(this.element.attributes[3])
    if (this.checkboxValue === true) {
      this.tom = new TomSelect(this.element, {
        plugins: ['input_autogrow'],
      })
    } else {
      this.tom = new TomSelect(this.element)
    }
  }

  display() {
    this.tom.settings.placeholder = "";
    this.tom.inputState();
  }

}
