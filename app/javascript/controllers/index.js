import { Application } from "@hotwired/stimulus"

import TestTimerController from "./test_timer_controller"

const application = Application.start()

application.register("test-timer", TestTimerController)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)


// Configure Stimulus development experience
application.debug = true
window.Stimulus   = application

export { application }