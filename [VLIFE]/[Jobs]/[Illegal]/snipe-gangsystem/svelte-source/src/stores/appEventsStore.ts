import { writable, Writable } from "svelte/store";
import fetchNUI from '../utils/fetch';
import gangMethods from './appStores/gangStore'

interface appsState {
    showSettings: Writable<boolean>,
    showGang: Writable<boolean>,
}

const store = () => {
  const appEventsStore: appsState = {
    showSettings: writable(false),
    showGang: writable(false),
  }

  const appEventMethods = {
    closeApp(appName) {
        switch (appName) {
            case "showSettings":
                appEventsStore.showSettings.set(false);
                break;
            case "showGang":
              gangMethods.closeTab("management");
              gangMethods.closeTab("funds");
              appEventsStore.showGang.set(false);
              break;
        }
    //   fetchNUI('CloseDocument');
    },
    showApp(appName) {
        switch (appName) {
            case "showSettings":
                appEventsStore.showSettings.set(true);
                break;
            case "showGang":
              appEventsStore.showGang.set(true);
              break;
        }
    },
  }

  return {
    ...appEventsStore,
    ...appEventMethods
  }
}

export default store();