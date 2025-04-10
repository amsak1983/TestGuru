import { Application } from "@hotwired/stimulus"

import TestTimerController from "./test_timer_controller"
import ImagePreviewController from "./admin/image_preview_controller"
//import CharacterCounter from "@stimulus-components/character-counter"

const application = Application.start()

application.register("test-timer", TestTimerController)
application.register("image-preview", ImagePreviewController)



// Configure Stimulus development experience
application.debug = true
window.Stimulus   = application

export { application }