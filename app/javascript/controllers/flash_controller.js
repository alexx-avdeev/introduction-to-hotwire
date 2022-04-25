import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
    connect() {
        const toast = new bootstrap.Toast(this.element)
        toast.show()
        // Toast will disappear by default, the following line removes it from the document after it is already disappeared
        setTimeout(() => this.element.remove(), 10000)
    }
}
