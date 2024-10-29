<script lang="ts">
    import { EventHandler } from '../../utils/eventHandler';
    import appEventMethods from '../../stores/appEventsStore';
    import appEventsStore from '../../stores/appEventsStore';
    import * as urlmodule from 'valid-url';
    import {wallpaper_url1} from '../../stores/settingsAppStore';
    import Fa from 'svelte-fa'
    import { faClose } from '@fortawesome/free-solid-svg-icons'

    let acceptedExtensions = ['jpg', 'jpeg', 'png'];
    let wallpaper_url=$wallpaper_url1;
    let isValidUrlBool = true;
    let cannotSubmit = true;

    EventHandler();
    let { showSettings } = appEventsStore;

    async function submitForm(event) {
        event.preventDefault();

        const img = new Image();
        img.src = wallpaper_url;
        localStorage.setItem('wallpaper_url1', wallpaper_url)
        wallpaper_url1.set(wallpaper_url);
    }

    function isUrlValid() {
        isValidUrlBool = isUrlImg() && (urlmodule.isUri(wallpaper_url) || urlmodule.isHttpUri(wallpaper_url) || urlmodule.isHttpsUri(wallpaper_url) || urlmodule.isWebUri(wallpaper_url)) ? true : false;
        return isValidUrlBool;
    }

    function isUrlImg() {
        if(wallpaper_url == '') {
            return false;
        }
        let valueArray = wallpaper_url.split('.');
        let length = valueArray.length;
        return (acceptedExtensions.includes(valueArray[length-1].toLowerCase()));
    }

    function disableSubmit() {
        cannotSubmit = !isUrlValid();

        return cannotSubmit;
    }

</script>
{#if $showSettings}
    <div class="modal modal-lg items-center justify-center fade fixed w-full h-full outline-none overflow-y-auto" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog flex relative w-auto">
            <div class="modal-content border-none shadow-lg relative flex flex-col w-full pointer-events-auto bg-dark-800/95 bg-clip-padding rounded-xs outline-none text-current">
                <div class="modal-header flex flex-shrink-0 items-center justify-between p-2 text-white bg-dark-900/75">
                    <p class="text-sm font-medium pt-1 ml-2">Settings</p>
                    <p class="hover:text-sky-500 cursor-pointer bg-circle bg-red-500 hover:bg-red-800" on:click={()=>appEventMethods.closeApp('showSettings')}>
                    </p>
                </div>
                <div class="modal-body relative p-4 text-white">
                    <p class="mt-2 inline-block">URL: </p>
                    <input id="wallpaper_url" style="width: 80%;" name="wallpaper_url" type="search" bind:value={wallpaper_url} class="inline-block mt-2 ml-2 form-input p-1 rounded-sm text-black" on:click={() => isUrlValid} on:keyup={disableSubmit} />
                    <center>
                        <button class="modal-button px-2 py-1 text-sm font-semibold {cannotSubmit ? 'text-gray-500 border border-gray-500 cursor-default' : 'border border-sky-900 hover:text-white hover:bg-sky-900/50 hover:border-transparent focus:outline-none focus:ring-2 focus:ring-sky-900 focus:ring-offset-2'}" type="button" disabled={cannotSubmit} on:click={submitForm}>Update</button>
                    </center>
                </div>
            </div>
        </div>
    </div>
{/if}


<style>
    .modal-dialog {
        width: 25vw !important;
        height: 10vw;
        top: 10vw;
        }
</style>