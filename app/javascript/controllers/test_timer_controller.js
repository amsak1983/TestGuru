import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["display", "remainingTime"]
    static values = { duration: Number }

    connect() {
        this.startTime = new Date(this.element.dataset.startTime)
        this.duration = this.durationValue * 1000
        this.updateTimer()
        this.intervalId = setInterval(() => this.updateTimer(), 1000)
    }

    disconnect() {
        clearInterval(this.intervalId)
    }

    updateTimer() {
        const elapsedTime = new Date() - this.startTime
        let remainingTime = Math.max(0, (this.duration - elapsedTime) / 1000)

        if (remainingTime <= 60) {
            this.displayTarget.style.color = "red"
        }

        const minutes = Math.floor(remainingTime / 60)
        const seconds = Math.floor(remainingTime % 60).toString().padStart(2, '0')

        this.remainingTimeTarget.textContent = `${minutes}:${seconds}`

        if (remainingTime <= 0) {
            clearInterval(this.intervalId)
            this.submitForm()
        }
    }

    submitForm() {
        const form = document.querySelector('form')
        form.requestSubmit()
    }
}