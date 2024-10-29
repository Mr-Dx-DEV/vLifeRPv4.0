<script lang="ts">
    import { onMount } from 'svelte';
    import appEventMethods from '../../../stores/appEventsStore';
    import appEventsStore from '../../../stores/appEventsStore';
    import gangMethods from '../../../stores/appStores/gangStore';
    import gangStore from '../../../stores/appStores/gangStore';
    import fetchNui from '../../../utils/fetch'
    
    let { funds } = gangStore;

    export let gangName;
    let loadingData = false;
    let totalGangFunds;
    let isOwner;

    let memberBoxColWidth = 10;

    let depositFund;
    let depositBtnDisable = true;
    let depositSubmitError = false;
    let showDepositModal = false;
    let depositing = false;

    let withdrawFund;
    let withdrawBtnDisable = true;
    let withdrawSubmitError = '';
    let showWithdrawModal = false;
    let withdrawing = false;

    async function loadDataOnMount() {
        loadingData = true;
        //fetch call to get total fund -> send gangName in the fetch request
        if($funds) {
            const formData = {gangName: gangName}
            const data = await fetchNui('getFundsData',formData);
            totalGangFunds = data.totalGangFunds;
            isOwner = data.isOwner;
            memberBoxColWidth = isOwner ? 10 : 16;
        }
        
        loadingData = false;
    }
    onMount(async() => {
        await loadDataOnMount();
	});

    function disableDepositSubmit() {
        depositBtnDisable = depositFund === 0 || depositFund.trim() === '' || parseFloat(depositFund) <= 0 || isNaN(parseFloat(depositFund));
        return depositBtnDisable;
    }

    async function deposit() {
        depositing = true;
        const formData = {
            gangName: gangName,
            depositAmount: depositFund
        }
        depositSubmitError = await fetchNui('depositFunds', formData);
        //get deposit submit error -> depositSubmitError = true
        depositing = false;
            
        
        if(!depositSubmitError) {
            showDepositModal = false;
            await loadDataOnMount();

        }
        
    }

    function disableWithdrawSubmit() {
        if(withdrawFund > totalGangFunds){
            withdrawSubmitError = 'Withdrawal amount exceeded:'+totalGangFunds;
        } else if (parseFloat(withdrawFund) < 0) {
            withdrawSubmitError = 'Withdrawal amount cannot be negative.';
        } else {
            withdrawSubmitError = '';
        }
        withdrawBtnDisable = withdrawSubmitError!=='' || withdrawFund === 0 || withdrawFund.trim() === '' || parseFloat(withdrawFund) <= 0 || isNaN(parseFloat(withdrawFund));
        
        return withdrawBtnDisable;
    }

    async function withdraw() {
        withdrawing = true;
        const formData = {
            gangName: gangName,
            withdrawAmount: withdrawFund
        }
        await fetchNui('withdrawFunds', formData);

        withdrawing = false;
        showWithdrawModal = false;
        await loadDataOnMount();

        
    }

</script>
<div class="funds">
    {#if loadingData}
        <center><div class="loader"></div></center>
    {/if}
    {#if !loadingData}
        <div class="total-funds font-bold text-lg">
            Total Gang Funds: <p class="inline-block text-green-300/80">${totalGangFunds}</p>
        </div>
        <div class="funds-body">
            <div class="body-part" style="margin-left: {memberBoxColWidth}vw;">
                <button class="border border-blue-700 hover:bg-blue-700" on:click={()=>showDepositModal = !showDepositModal}>Deposit</button>
                {#if showDepositModal}
                    <div class="modal small-modal modal-lg items-center justify-center fade fixed w-full h-full outline-none overflow-y-auto" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog small-modal-dialog flex relative">
                            <div class="modal-content border-none shadow-lg relative flex flex-col w-full pointer-events-auto bg-dark-500 bg-clip-padding rounded-xs outline-none text-current">
                                {#if !depositing}
                                    <div class="modal-body relative text-white small-modal-body">
                                        <p>Enter Deposit Amount</p>
                                        <div class="block">
                                            <input id="depositFund" placeholder="Deposit Amount" name="depositFund" bind:value={depositFund} class="placeholder-opacity-50 form-input leading-loose rounded-sm text-black mt-2 pl-2" on:keyup={disableDepositSubmit} /><br/>
                                            {#if depositSubmitError}
                                                <p class="text-xs text-red error-message">You do not have enough funds to make this deposit.</p>
                                            {/if}
                                            <button class="inline-block hover:text-blue-500" on:click={()=>showDepositModal = false}>Cancel</button>
                                            <button class="inline-block rounded-sm {depositBtnDisable ? 'cursor-default border border-gray-300 text-gray-800 bg-gray-300' : 'cursor-pointer border border-blue-700 text-blue-700 hover:text-white hover-bg-blue-700'}" disabled={depositBtnDisable} on:click={deposit}>Submit</button>
                                        </div>
                                    </div>
                                {/if}
                                {#if depositing}
                                    <div class="modal-body relative text-white small-modal-body">
                                        <center><div class="button-spinner"></div></center>
                                    </div>
                                {/if}
                            </div>
                        </div>
                    </div>
                {/if}
            </div>
            {#if isOwner}
                <div class="body-part" style="margin-left: {memberBoxColWidth}vw;">
                    <button class="border border-green-700 hover:bg-green-700" on:click={()=>showWithdrawModal = !showWithdrawModal}>Withdraw</button>
                    {#if showWithdrawModal}
                        <div class="modal small-modal modal-lg items-center justify-center fade fixed w-full h-full outline-none overflow-y-auto" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog small-modal-dialog flex relative">
                                <div class="modal-content border-none shadow-lg relative flex flex-col w-full pointer-events-auto bg-dark-500 bg-clip-padding rounded-xs outline-none text-current">
                                    {#if !withdrawing}
                                        <div class="modal-body relative text-white small-modal-body">
                                            <p>Enter Withdrawal Amount</p>
                                            <div class="block">
                                                <input id="withdrawFund" placeholder="Withdraw Amount" name="withdrawFund" bind:value={withdrawFund} class="placeholder-opacity-50 form-input leading-loose rounded-sm text-black mt-2 pl-2" on:keyup={disableWithdrawSubmit} /><br/>
                                                {#if withdrawSubmitError !== ''}
                                                    <p class="text-xs text-red error-message">{withdrawSubmitError}</p>
                                                {/if}
                                                <button class="inline-block hover:text-blue-500" on:click={()=>showWithdrawModal = false}>Cancel</button>
                                                <button class="inline-block rounded-sm {withdrawBtnDisable ? 'cursor-default border border-gray-300 text-gray-800 bg-gray-300' : 'cursor-pointer border border-green-700 text-green-700 hover:text-white hover-bg-green-700'}" disabled={withdrawBtnDisable} on:click={withdraw}>Withdraw</button>
                                            </div>
                                        </div>
                                    {/if}
                                    {#if withdrawing}
                                        <div class="modal-body relative text-white small-modal-body">
                                            <center><div class="button-spinner"></div></center>
                                        </div>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    {/if}
                </div>
            {/if}
        </div>
    {/if}
</div>
<style>
    .total-funds {
        margin-top: 2vw;
        margin-left: 13.5vw;
    }

    .funds-body {
        margin-top: 5vw;
    }

    .body-part {
        display: inline-block;
    }

    .body-part > button {
        padding: 0.5vw;
        padding-left: 0.75vw;
        padding-right: 0.75vw;
    }
</style>