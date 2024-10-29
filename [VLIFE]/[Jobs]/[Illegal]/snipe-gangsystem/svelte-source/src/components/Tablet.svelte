<script lang="ts">
    import { EventHandler } from '../utils/eventHandler';
    import exampleStore from '../stores/exampleStore';
    import appEventMethods from '../stores/appEventsStore';
    import appEventsStore from '../stores/appEventsStore';
    import {wallpaper_url1} from '../stores/settingsAppStore';
    import { onMount } from 'svelte';
    import Settings from './apps/Settings.svelte';
    import GangAppHome from './apps/gang/GangAppHome.svelte';
    import Fa from 'svelte-fa'
    import { faUserSecret, faCog } from '@fortawesome/free-solid-svg-icons'
    import fetchNui from '../utils/fetch';

    let {showGangApp} = exampleStore;

    let img_src = $wallpaper_url1;
    
    onMount(async () => {
        appEventMethods.closeApp("showSettings");
        appEventMethods.closeApp("showGang");
		document.getElementById('tablet-screen').style.backgroundImage = 'url(' + img_src + ')';

	});

    $: if(img_src !== $wallpaper_url1) {
        img_src = $wallpaper_url1;
        document.getElementById('tablet-screen').style.backgroundImage = 'url(' + img_src + ')';
    }

    EventHandler();
    let { showSettings } = appEventsStore;
    let { showGang } = appEventsStore;
</script>
<div id="outer-div" class="mx-10 my-5 bg-zinc-700 text-white rounded-md p-2" >
    <div id="tablet-screen" class="inner-div box-content bg-zinc-600 text-black rounded-md">
        <div class="block p-2">
            <div class="app-details ml-2 text-center bg-dark-800/35 hover:bg-dark-800/85" on:click={()=>appEventMethods.showApp('showSettings')}>
                <Fa icon={faCog} color="white" size="lg" class="pl-2" style="margin-left: 0.9vw;"/>
                <p class="text-white text-base">Settings</p>
            </div>
            {#if $showGangApp}
                <div class="app-details ml-2 text-center bg-dark-800/35 hover:bg-dark-800/85" on:click={()=>appEventMethods.showApp('showGang')}>
                    <Fa icon={faUserSecret} color="white" size="lg" class="pl-2" style="margin-left: 0.97vw;"/>
                    <p class="text-white text-base">Gang</p>
                </div>
            {/if}
        </div>
        <!-- <div class="footer bg-zinc-700/95 text-white"> -->
        <!-- </div> -->
    </div>
    {#if $showSettings}
        <Settings/>
    {/if}

    {#if $showGang}
        <GangAppHome/>
    {/if}
</div>
<style>
    /* .svg-icon {
        margin-left: 0.8vw;
    } */
    #outer-div {
		position: absolute;
		border: solid 1px gray;
		width: 80%;
        height: 93%;
        margin-left: 9vw;
	}

    .inner-div{
        width: 100%;
        height:100%;
        background-size: 100% 100%;
    }
</style>