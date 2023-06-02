import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['itemFields', 'template'];

  addNewItem() {
    const newItem = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
    this.itemFieldsTarget.insertAdjacentHTML('beforeend', newItem);
  }

  removeItem(event) {
    const item = event.target.closest('.nested-fields');
    item.querySelector("input[name*='_destroy']").value = 1;
    item.style.display = 'none';
  }
}
