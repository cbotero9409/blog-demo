import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize(){}
  connect(){}
  toggleForm(e) {
    e.preventDefault();
    e.stopPropagation();
    const formID = e.params['form']
    const form = document.getElementById(formID)
    form.classList.toggle('d-none')
    form.classList.toggle('mt-5')
    const bodyID = e.params['body']
    document.getElementById(bodyID).classList.toggle('d-none')
  }
}
