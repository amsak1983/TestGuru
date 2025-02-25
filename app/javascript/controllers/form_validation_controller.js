// app/javascript/controllers/form_validation_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input"]

    connect() {
        this.inputTargets.forEach(input => {
            input.addEventListener('input', this.validate.bind(this))
        })
    }

    validate(event) {
        const input = event.target
        input.classList.remove('is-invalid', 'is-valid')

        if (input.checkValidity()) {
            input.classList.add('is-valid')
        } else {
            input.classList.add('is-invalid')
        }
    }

    submit(event) {
        const isValid = this.inputTargets.every(input => input.checkValidity())
        if (!isValid) {
            event.preventDefault()
            this.inputTargets.forEach(input => {
                if (!input.checkValidity()) {
                    input.classList.add('is-invalid')
                }
            })
        }
    }
}