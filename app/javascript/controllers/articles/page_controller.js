import { Controller } from "@hotwired/stimulus"

// "Global" variables
let menuOpen = false;

export default class extends Controller {
  connect() {
    // Get URL fragment
    let fragment = window.location.hash.split("#")[1];

    // Account for empty fragment
    if (fragment === "" || fragment === undefined) {
      window.location.hash = "getting-started_index";
      fragment = window.location.hash.split("#")[1];
    }

    // Load frame source
    let frame = document.querySelector("turbo-frame#article");
    frame.src = "/embedded/" + fragment;
    frame.reload();

    // Set the active navigation button
    let pendingButtons = document.getElementsByClassName(fragment);

    for (let button of pendingButtons) {
      button.classList.add("active");
    }
  }

  toggleMenu() {
    if (menuOpen) {
      document.getElementsByClassName("mobile-sidebar")[0].classList.remove("visible");
      menuOpen = false;
      return;
    }

    document.getElementsByClassName("mobile-sidebar")[0].classList.add("visible");
    menuOpen = true;
  }

  navigate(event) {
    // Remove 'active' class from all navigation buttons
    let buttons = document.getElementsByClassName('nav-button');

    for (let button of buttons) {
      button.classList.remove("active");
    }

    // Assign 'active' class to trigger button
    // Set the active navigation button
    let pendingButtons = document.getElementsByClassName(event.srcElement.id);

    for (let button of pendingButtons) {
      button.classList.add("active");
    }
    
    // Update frame source
    let frame = document.querySelector("turbo-frame#article");
    frame.src = "/embedded/" + event.srcElement.id;
    frame.reload();

    // Update window fragment
    window.location.hash = event.srcElement.id;

    // Close sidebar if visible (mobile)
    this.toggleMenu();
  }
}
