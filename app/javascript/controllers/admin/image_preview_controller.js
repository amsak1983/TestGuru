import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "select", "preview" ]
    connect() {
    }

    updateImage() {
        const selectedImage = this.selectTarget.value;
        if (selectedImage) {
            this.previewTarget.src = `/badges/${selectedImage}`;
        } else {
            this.previewTarget.src = "";
        }
    }
}