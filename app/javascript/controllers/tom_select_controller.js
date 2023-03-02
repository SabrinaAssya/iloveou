import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

export default class extends Controller {
  static values = {
    checkbox: Boolean,
    filter: Boolean
  }
  connect() {
    console.log("coucou")
    console.log(this.element.attributes[3])
    if (this.checkboxValue) {
      this.tom = new TomSelect(this.element, {
        plugins: ['input_autogrow'],
      })
    } else if (this.filterValue) {
      this.tom = new TomSelect(this.element, {
        plugins: ['dropdown_input'],
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
