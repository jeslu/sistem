import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="check"
export default class extends Controller {
  connect() {
    console.log("check controller conectado");
  }
  active(event){
    console.log("chec controller activado");
    console.log(event.target);
    const id = event.target.dataset.id
    const csrfToken = document.querySelector("[name='csrf-token']").content


    fetch(`/acounts/${id}/active`, {
      method: 'POST', // *GET, POST, PUT, DELETE, etc.
      mode: 'cors', // no-cors, *cors, same-origin
      cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
      credentials: 'same-origin', // include, *same-origin, omit
      headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({ active: event.target.checked })
    })
    .then(response => response.text())
    .then(Turbo.renderStreamMessage)
  }
}
