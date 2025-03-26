// app/javascript/controllers/participant_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["status"]

    connect() {
        console.log("Participant controller connected:", this.element)
    }

    toggle(event) {
        const checkbox = event.target
        const participantId = checkbox.dataset.participantId
        const field = checkbox.dataset.field
        const checked = checkbox.checked

        console.log("Toggle clicked for:", participantId, field, checked)

        fetch(`/participants/${participantId}/toggle_payment`, {
            method: "PATCH",
            headers: {
                "Content-Type": "application/json",
                "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
            },
            body: JSON.stringify({
                field: field,
                value: checked
            })
        }).then(response => {
            if (response.ok) {
                console.log("Update successful")
                this.showStatus()
            } else {
                console.error("Update failed")
            }
        }).catch(error => {
            console.error("Network error:", error)
        })
    }

    showStatus() {
        if (this.hasStatusTarget) {
            this.statusTarget.classList.remove("opacity-0")
            setTimeout(() => {
                this.statusTarget.classList.add("opacity-0")
            }, 1200)
        }
    }
}
