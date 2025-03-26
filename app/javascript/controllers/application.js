import { Application } from "@hotwired/stimulus"

console.log("Application.js is loaded 1")
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
