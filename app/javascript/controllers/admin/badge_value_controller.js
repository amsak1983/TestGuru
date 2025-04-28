// app/javascript/controllers/admin/badge_value_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["rule", "valueField", "template"]

    connect() {
        this.switchValueField()
    }

    switchValueField() {
        const rule = this.ruleTarget.value
        const template = this.templateTargets.find(t => t.dataset.rule === rule) || this.templateTargets.find(t => t.dataset.rule === 'default')
        this.valueFieldTarget.innerHTML = template.innerHTML
    }
}