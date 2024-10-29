<script lang="ts">
import { EventHandler } from './utils/eventHandler';
import exampleStore from './stores/exampleStore'
import methods from './stores/exampleStore'
import Tablet from './components/Tablet.svelte';

  EventHandler();
  
  document.onkeyup = methods.handleKeyUp;
  let { show } = exampleStore;

</script>

{#if $show}
  <Tablet />
{/if}