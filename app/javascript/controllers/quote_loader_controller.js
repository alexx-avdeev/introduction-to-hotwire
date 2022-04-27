import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="quote-loader"
export default class extends Controller {
    static targets = [ 'quote' ]
    static values = { url: String }

    connect() {
        fetch(this.urlValue, {
            headers: {
                'Origin': 'http://localhost:3000'
            }
        })
            .then(response => response.json())
            .then(data => this.quoteTarget.innerHTML = data[0].h)
    }
}
