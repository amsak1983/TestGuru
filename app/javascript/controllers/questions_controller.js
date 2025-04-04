import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["item", "newForm"]
    static values = { url: String }

    connect() {
        console.log("Questions controller connected")
    }

    async remove(event) {
        event.preventDefault()
        const item = event.target.closest("[data-questions-target='item']")
        const questionId = item.dataset.id

        if (!questionId) {
            item.remove()
            return
        }

        try {
            const response = await fetch(`/admin/questions/${questionId}`, {
                method: 'DELETE',
                headers: {
                    'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
                    'Accept': 'application/json'
                }
            })

            if (response.ok) {
                item.remove()
            } else {
                const data = await response.json()
                alert(data.errors || 'Error deleting question')
            }
        } catch (error) {
            console.error('Error:', error)
            alert('Error deleting question')
        }
    }


}