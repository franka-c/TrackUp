// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
console.log("Application.js is loaded")
import "@hotwired/turbo-rails"
import "@rails/ujs"
import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }