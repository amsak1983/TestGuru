import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["container", "item", "form"]

    connect() {
        this.template = this.containerTarget.querySelector("template")
    }

    remove(event) {
        const item = event.target.closest("[data-nested-form-target='item']")
        const destroyInput = item.querySelector("input[name*='_destroy']")
        if (destroyInput) {
            destroyInput.value = "1"
            item.style.display = "none"
        } else {
            item.remove()
        }
    }
}