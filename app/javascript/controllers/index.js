import { Application } from "@hotwired/stimulus"

import TestTimerController from "./test_timer_controller"
import ImagePreviewController from "./admin/image_preview_controller"
import BadgeValueController from "./admin/badge_value_controller"

const application = Application.start()

application.register("test-timer", TestTimerController)
application.register("image-preview", ImagePreviewController)
application.register("badge-value", BadgeValueController)


// Configure Stimulus development experience
application.debug = true
window.Stimulus   = application

export { application }