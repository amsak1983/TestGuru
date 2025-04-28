import { Controller } from "@hotwired/stimulus"

// Контроллер для копирования значения из badge в input
export default class extends Controller {
    static targets = ["input"]
    static values = {
        param: String
    }

    copy(event) {
        const clickedElement = event.currentTarget
        const value = clickedElement.dataset.categoryCopyValueParam

        if (this.hasInputTarget && value) {
            this.inputTarget.value = value
            this.inputTarget.dispatchEvent(new Event('input')) // важно для реактивности
        }
    }
}