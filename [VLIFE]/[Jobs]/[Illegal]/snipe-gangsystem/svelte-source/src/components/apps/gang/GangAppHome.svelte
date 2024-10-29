<script lang="ts">
    import { EventHandler } from '../../../utils/eventHandler';
    import appEventMethods from '../../../stores/appEventsStore';
    import appEventsStore from '../../../stores/appEventsStore';
    import gangMethods from '../../../stores/appStores/gangStore';
    import gangStore from '../../../stores/appStores/gangStore';
    import { onMount } from 'svelte';
    import Management from './Management.svelte';
    import fetchNui from '../../../utils/fetch';
    import DefaultView from './DefaultView.svelte';
    import Funds from './Funds.svelte';

    let gangName;
    let gangNameDisplay;
    let logoUrl;
    let onlineMembers;
    let noOfFlags;
    let loadingDefaultData = false;
    let blipState;

    onMount(async() => {
        loadingDefaultData = true;
        gangMethods.closeTab('management');
        gangMethods.closeTab('funds');
        // fetch call to get default values
        const defaultData = await fetchNui('getGangData');
        gangName = defaultData.gangName;
        gangNameDisplay = defaultData.gangName.toUpperCase();
        logoUrl = defaultData.logoUrl;
        onlineMembers = defaultData.onlineMembers;
        noOfFlags = defaultData.noOfFlags;
        loadingDefaultData = false;
        blipState = defaultData.blipState;
	});

    EventHandler();
    let { showGang } = appEventsStore;
    let { management } = gangStore;
    let { funds } = gangStore;

    let managementTab = false;
    let fundsTab = false;

    function openTab(value) {
        if(loadingDefaultData) {
            return;
        }

        if(value == 'management') {
            managementTab = !managementTab;
        }

        if(value == 'funds') {
            fundsTab = !fundsTab;
        }

        if(value == 'management' && managementTab) {
            //show management
            fundsTab = false;
            gangMethods.closeTab('funds');
            gangMethods.showTab('management');
            //fetch call to get management tab data from backend
        } else if(value == 'management' && !managementTab) {
            //close management
            gangMethods.closeTab('management');
        } else if(value == 'funds' && fundsTab) {
            //show funds
            managementTab = false;
            gangMethods.closeTab('management');
            gangMethods.showTab('funds');
        } else if(value == 'funds' && !fundsTab) {
            //close funds
            gangMethods.closeTab('funds');
        }
    }
</script>
{#if $showGang} <!-- && !loadingDefaultData-->
    <div class="modal modal-lg items-center justify-center fade fixed w-full h-full outline-none overflow-y-auto" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog flex relative">
            <div class="modal-content border-none shadow-lg relative flex flex-col w-full pointer-events-auto bg-dark-800/95 bg-clip-padding rounded-xs outline-none text-current">
                <div class="modal-header flex flex-shrink-0 items-center justify-between p-2 text-white bg-dark-900/75" style="border-bottom: 1px solid #1f2937;">
                    <div class="pt-1">
                        <img src={logoUrl} class="app-header-logo inline-block" alt="gangLogo" />
                        <p class="text-lg font-bold pt-1 ml-1 inline-block">{gangNameDisplay}</p>
                    </div>
                    <p class="hover:text-sky-500 cursor-pointer bg-circle bg-red-500 hover:bg-red-800 mr-2" on:click={()=>appEventMethods.closeApp('showGang')}>
                    </p>
                    <!-- <p class="text-md font-medium hover:text-sky-500 cursor-pointer mr-5" on:click={()=>appEventMethods.closeApp('showGang')}>X</p> -->
                </div>
                <div class="modal-body relative text-white">
                    <div class="nav pr-3 divide-x divide-red">
                        <ul class="mt-9 ml-4">
                            <li disabled={loadingDefaultData} class="{loadingDefaultData ? 'cursor-default' : 'cursor-pointer'}" on:click={()=>openTab('management')}>
                                <p class="{$management ? 'text-yellow-400' : 'text-white'} hover:text-yellow-400/80 p-1">Manage</p>
                            </li>
                            <li disabled={loadingDefaultData} class="mt-5 {loadingDefaultData ? 'cursor-default' : 'cursor-pointer'}" on:click={()=>openTab('funds')}>
                                <p class="{$funds ? 'text-yellow-400' : 'text-white'} hover:text-yellow-400/80 p-1">Funds</p>
                            </li>
                        </ul>
                    </div>
                    {#if !$management && !$funds && loadingDefaultData}
                        <div class="tab-content content-tab">
                            <center><div class="loader mt-7"></div></center>
                        </div>
                    {/if}
                    {#if !$management && !$funds && !loadingDefaultData}
                        <div class="tab-content content-tab">
                            <DefaultView noOfFlags={noOfFlags} onlineMembers={onlineMembers} blipState = {blipState} />
                        </div>
                    {/if}
                    {#if $management}
                        <div class="tab-content content-tab">
                            <Management gangName={gangName} />
                        </div>
                    {/if}
                    {#if $funds}
                        <div class="tab-content content-tab">
                            <Funds gangName={gangName} />
                        </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
{/if}

<style>
    .modal-dialog {
        width: 60vw !important;
        height: 60vw;
        top:22vw;
    }

    .nav {
        height:100%;
        width:6vw;
        float:left;
        padding-right:0.75vw;
        border-right: 1px solid #1f2937;
    }

    .content-tab {
        padding-right: 2vw;
        padding-top: 0.5vw;
        margin-left: 11.5vw;
        height: 100% !important;
    }
</style>