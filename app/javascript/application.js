//= require jquery3
//= require popper
//= require bootstrap

// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import * as bootstrap from "bootstrap"
import "./controllers"
import "trix"
import "@rails/actiontext"


document.addEventListener('turbolinks:load', function() {
    console.log("Page loaded with TurboLinks");
    
    const btnSwitch = document.getElementById('btnSwitch');
    if (btnSwitch) {
      console.log("Button element found");
      
      btnSwitch.addEventListener('click', () => {
        console.log("Button clicked");
        
        const currentTheme = document.documentElement.getAttribute('data-bs-theme');
        if (currentTheme === 'dark') {
          document.documentElement.setAttribute('data-bs-theme', 'light');
        } else {
          document.documentElement.setAttribute('data-bs-theme', 'dark');
        }
      });
    }
  });

