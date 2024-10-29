<script lang="ts">
    import fetchNui from '../../../utils/fetch';

    export let noOfFlags;
    export let onlineMembers;
    export let blipState;
    let checked = false;

    function handleClick(event){
        const target = event.target
        const state = target.getAttribute('aria-checked')
        blipState = state === 'true' ? false : true
        //backend send toggle-blips call
        fetchNui("blipstate", blipState)
    }
</script>
<div class="gang-info">
    <div class="block">
        <div class="inline-block">
            <span class="font-semibold text-lg">Number of Flags</span><p class="block font-normal m-1 text-green-300/80 text-center">{noOfFlags}</p>
        </div>
        <div class="inline-block" style="margin-left:13vw;">
            <span class="font-semibold text-lg inline-block">Total Available Members</span><p class="block font-normal m-1 text-green-300/80 text-center">{onlineMembers}</p>
        </div>
    </div>
    
    
    <div class="s s--slider text-md">
        <span class="font-semibold">Enable/Disable Blips</span> <br/>
        <button role="switch" class="block" aria-checked={blipState} on:click={handleClick}></button>
    </div>
</div>
<style>
    .gang-info {
        margin-left: 2vw;
        margin-top: 4vw;
    }
    .s--slider {
        display: flex;
        align-items: center;
        margin-top: 5vw;
        margin-left: 7vw;
    }

    .s--slider button {
        width: 3em;
        height: 1.6em;
        position: relative;
        margin: 0 0 0 0.5em;
        background: gray;
        border: none;
    }

    .s--slider button::before {
        content: '';
        position: absolute;
        width: 1.3em;
        height: 1.3em;
        background:black;
        top: 0.15em;
        right: 1.5em;
        transition: transform 0.3s;
    }

    .s--slider button[aria-checked='true']{
        background-color: #6ee7b7
    }

    .s--slider button[aria-checked='true']::before{
        transform: translateX(1.3em);
        transition: transform 0.3s;
    }

    .s--slider button {
        border-radius: 1.5em;
    } 
    
    .s--slider button::before {
        border-radius: 100%;
    }
</style>