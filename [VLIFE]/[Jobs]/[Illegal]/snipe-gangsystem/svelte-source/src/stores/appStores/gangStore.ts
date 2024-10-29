import { writable, Writable } from "svelte/store";
import fetchNUI from '../../utils/fetch';

interface gangState {
    management: Writable<boolean>,
    funds: Writable<boolean>,
}

const store = () => {
  const gangEventStore: gangState = {
    management: writable(false),
    funds: writable(false),
  }

  const gangMethods = {
    closeTab(tabType) {
        switch (tabType) {
            case "management":
                gangEventStore.management.set(false);
                break;
            case "funds":
              gangEventStore.funds.set(false);
              break;
        }
    //   fetchNUI('CloseDocument');
    },
    showTab(tabType) {
        switch (tabType) {
            case "management":
                gangEventStore.management.set(true);
                break;
            case "funds":
              gangEventStore.funds.set(true);
              break;
        }
    },
  }

  return {
    ...gangEventStore,
    ...gangMethods
  }
}

export default store();