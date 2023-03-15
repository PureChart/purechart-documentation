import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

export default class extends Controller {
  connect() {
    // Get URL fragment
    let fragment = window.location.hash.split("#")[1];

    // Account for empty fragment
    if (fragment === "" || fragment === undefined) {
      window.location.hash = "getting-started";
      fragment = window.location.hash.split("#")[1];
    }

    // Load frame source
    let frame = document.querySelector("turbo-frame#article");
    frame.src = "/embedded/" + fragment;
    frame.reload()

    // Set the active navigation button
    document.getElementById(fragment).classList.add("active");
  }

  displayMenu() {
    document.getElementsByClassName("sidebar")[0].classList.add("visible")
  }

  closeMenu() {
    document.getElementsByClassName("sidebar")[0].classList.remove("visible")
  }

  navigate(event) {
    // Remove 'active' class from all navigation buttons
    let buttons = document.getElementsByClassName('nav-button');

    for (let button of buttons) {
      button.classList.remove("active");
    }

    // Assign 'active' class to trigger button
    event.srcElement.classList.add("active");
    
    // Update frame source
    let frame = document.querySelector("turbo-frame#article");
    frame.src = "/embedded/" + event.srcElement.id;
    frame.reload()

    // Update window fragment
    window.location.hash = event.srcElement.id;

    // Close sidebar if visible (mobile)
    document.getElementsByClassName("sidebar")[0].classList.remove("visible")
  }
}
