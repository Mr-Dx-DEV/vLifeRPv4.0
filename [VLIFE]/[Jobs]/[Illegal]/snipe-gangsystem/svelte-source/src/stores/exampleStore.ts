import { writable, Writable } from "svelte/store";
import fetchNUI from '../utils/fetch';
import appEventMethods from './appEventsStore';

interface exampleState {
  show: Writable<boolean>,
  showGangApp: Writable<boolean>
}

const store = () => {
  const exampleStore: exampleState = {
    show: writable(false),
    showGangApp: writable(false)
  }

  const methods = {
    closeForm() {
      appEventMethods.closeApp("showGang");
      appEventMethods.closeApp("showSettings");
      exampleStore.show.set(false);
      exampleStore.showGangApp.set(false);
      fetchNUI('closetablet');
    },
    showForm(isGang) {
      exampleStore.show.set(true);
      exampleStore.showGangApp.set(isGang);
    },
    handleKeyUp(data) {
      if (data.key == "Escape") {
        methods.closeForm();
      }
    },
  }

  return {
    ...exampleStore,
    ...methods
  }
}

export default store();