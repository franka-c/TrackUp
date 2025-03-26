pin "@hotwired/turbo-rails", to: "https://cdn.jsdelivr.net/npm/@hotwired/turbo-rails@7.3.0/+esm"
pin "@rails/ujs", to: "https://cdn.jsdelivr.net/npm/@rails/ujs@7.0.4/+esm"
pin "@hotwired/stimulus", to: "https://cdn.jsdelivr.net/npm/@hotwired/stimulus@3.2.2/+esm"

# Pin your main application file
pin "application", to: "application.js"

# Pin your controllers folder
pin "controllers", to: "controllers/index.js"
pin_all_from "app/javascript/controllers", under: "controllers"
