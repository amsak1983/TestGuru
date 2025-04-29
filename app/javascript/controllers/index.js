import { Application } from "@hotwired/stimulus"

import ImagePreviewController from "./admin/image_preview_controller"
import BadgeValueController from "./admin/badge_value_controller"
import CategoryCopyController from "./admin/category_copy_controller"

const application = Application.start()

application.register("image-preview", ImagePreviewController)
application.register("badge-value", BadgeValueController)
application.register("category-copy", CategoryCopyController)


// Configure Stimulus development experience
application.debug = true
window.Stimulus   = application

export { application }

