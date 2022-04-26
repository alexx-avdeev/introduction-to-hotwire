import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbo-frame-reload"
export default class extends Controller {
  frame = null

  initialize() {
    super.initialize()

    this.reload = this.reload.bind(this)

    this.frame = document.getElementById(this.element.dataset.targetFrame)
  }

  reload(event) {
    event.preventDefault()
    if (this.frame && this.frame.src) {
      this.frame.reload()
      /*
      const src = this.frame.src
      this.frame.src = null
      this.frame.src = src
       */
    }
  }
}
