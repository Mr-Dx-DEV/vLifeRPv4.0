<script lang="ts">
    import { EventHandler } from '../utils/eventHandler';
    import * as urlmodule from 'valid-url';
    import methods from '../stores/exampleStore';
    import fetchNui from '../utils/fetch';

    let acceptedExtensions = ['jpg', 'jpeg', 'gif', 'png'];
    let url='';
    let name='';
    let isValidUrlBool = true;
    let cannotSubmit = true;
    let formData = {};

    EventHandler();

    async function submitForm(event) {
        event.preventDefault();

        const img = new Image();
        img.src = url;

        img.addEventListener("load", () => {
            formData = {
                url: url,
                name: name,
                width: img.naturalWidth,
                height: img.naturalHeight
            }
        fetchNui('PrintDocument', formData);
        methods.closeForm();
        });
    }

    function isUrlValid() {
        isValidUrlBool = isUrlImg() && (urlmodule.isUri(url) || urlmodule.isHttpUri(url) || urlmodule.isHttpsUri(url) || urlmodule.isWebUri(url)) ? true : false;
        return isValidUrlBool;
    }

    function isUrlImg() {
        if(url == '') {
            return false;
        }
        let valueArray = url.split('.');
        let length = valueArray.length;
        return (acceptedExtensions.includes(valueArray[length-1].toLowerCase()));
    }

    function disableSubmit() {
        cannotSubmit = !isUrlValid() || name.trim() == '';

        return cannotSubmit;
    }
</script>
<div class="max-w-screen-sm mx-auto my-35 bg-dark-300 text-white rounded-lg">
    <form class="p-10">
        <span class="float-right hover:text-sky-500 cursor-pointer" on:click={methods.closeForm}>X</span><br/>
        <div class="pb-5 pt-8">
            <label for="url" class="text-md float-left text-right text-sky-500">URL:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input id="url" style="width: 70%;" name="url" type="search" bind:value={url} class="form-input border-2 border-sky-500 rounded-sm mb-3 text-black" on:click={() => isUrlValid} on:keyup={disableSubmit} /><br/>    
            {#if !isValidUrlBool}
	            <small class="float-auto text-red-500 ml-14">Please enter a valid url.</small>
            {/if}
        </div>
        
        <div class="pt-5">
            <label for="name" class="text-md float-left text-right text-sky-500">Name:&nbsp;&nbsp;</label>
            <input id="name" style="width: 70%;" name="name" type="search" bind:value={name} class="form-input border-2 border-sky-500 rounded-sm mb-3 text-black" on:keyup={disableSubmit} /><br/>    
        </div>
        <br/>
        
        <center>
            <button class="mt-5 px-7 py-1 text-md font-semibold rounded-full {cannotSubmit ? 'text-gray-500 border border-gray-500 cursor-default' : 'border border-sky-900 hover:text-white hover:bg-sky-900/50 hover:border-transparent focus:outline-none focus:ring-2 focus:ring-sky-900 focus:ring-offset-2'}" type="button" disabled={cannotSubmit} on:click={submitForm}>Save</button>
        </center>
    </form>
</div>

<!-- <div class="modal items-center justify-center fade fixed top-0 left-0 hidden w-full h-full outline-none overflow-x-hidden overflow-y-auto" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog flex relative w-auto pointer-events-none">
        <div class="modal-content border-none shadow-lg relative flex flex-col w-full pointer-events-auto bg-white bg-clip-padding rounded-md outline-none text-current">
            <div class="modal-header flex flex-shrink-0 items-center justify-between p-4 border-b border-gray-200 rounded-t-md">
                <h5 class="text-xl font-medium text-gray-800">Title</h5>
                <button type="button" class="btn-close box-content w-4 h-4 p-1 text-black border-none rounded-none opacity-50 focus:shadow-none focus:outline-none focus:opacity-100 hover:text-black hover:opacity-75 hover:no-underline" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body relative p-4 text-black">
                Messagekjfsdkjfskjdfnsdnfjsdskjbsjkbfjsfbjbj
            </div>
            <div class="modal-footer flex flex-shrink-0 flex-wrap items-center justify-end p-4 border-t border-gray-200 rounded-b-md">
                <button type="button" class="bg-dark-800 text-gray-500" data-bs-dismiss="modal" on:click={()=>methods.closeApp('showSettings')}>Ok</button>
            </div>
        </div>
    </div>
</div> -->