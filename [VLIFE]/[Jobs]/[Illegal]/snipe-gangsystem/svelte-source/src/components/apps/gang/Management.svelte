<script lang="ts">
    import { onMount } from 'svelte';
    import appEventMethods from '../../../stores/appEventsStore';
    import appEventsStore from '../../../stores/appEventsStore';
    import gangMethods from '../../../stores/appStores/gangStore';
    import gangStore from '../../../stores/appStores/gangStore';
    import Fa from 'svelte-fa'
    import { faPencil } from '@fortawesome/free-solid-svg-icons'
    import fetchNui from '../../../utils/fetch'

    export let gangName;

    let data;
    let addMember = false;
    let player_id = '';
    let new_player_role = '';
    let disableAddMember = true;
    let addingMember = false;
    let addMemberError = '';

    let loadingData = true;
    let memberList = [];
    let roleList = [];
    let allRolesList = [];
    let currentMembersCount = 0;
    let isOwner = false;
    let editingRole = {};
    let submitting = {};
    let showFireModal = {};
    let memberBoxColWidth = 55;

    let ownerLabel = '';
    let ownerRank = 0;
    let highestRole = {};
    let memberListCopy = [];

    async function loadDataOnMount() {
        loadingData = true;
        const formData = {gangName: gangName}
        const data = await fetchNui("getManagementData", formData);
        let memberListData = data.memberList;
        allRolesList = data.roleList;
        isOwner = data.isOwner;
        

        memberList = memberListData.map((member)=>{
            let roleName = allRolesList.filter(function (roleData) {
                if(roleData.rank === member.rank) {
                    return roleData;
                }
            });
            member['label'] = roleName[0].label;
            return member;
        });
        currentMembersCount = memberList.length;
        memberListCopy = memberList;

        ownerRank = Math.max(...allRolesList.map(role => role.rank));
        highestRole = allRolesList.filter(function(roleData){
            if(roleData.rank == ownerRank){
                return roleData
            }
        });
        ownerLabel = highestRole[0].label;

        roleList = allRolesList.filter(function(roleData) {
            return roleData.rank !== ownerRank;
        });


        memberList.forEach(element => {
            editingRole[element.source] = false;
            submitting[element.source] = false;
            showFireModal[element.source] = false;
        });

        memberBoxColWidth = isOwner ? 40 : 55;
        loadingData = false;
    }

    onMount(async() => {
        await loadDataOnMount();
	});

    async function changeRole(member) {
        submitting[member.source] = true;
        const role = allRolesList.filter(function(role) {
            return role.label == member.label
        })
        const formData = {
            source: member.source,
            rank: role[0].rank,
            gangName: gangName
        };
        
        //submit data
        await fetchNui('changeRole', formData)
        submitting[member.source] = false;
        await loadDataOnMount();
    }

    async function fireMember(member) {
        showFireModal[member.source] = !showFireModal[member.source];
        submitting[member.source] = true;
        
        const formData = {
            source: member.source,
            gangName: gangName
        };
        //submit data
        await fetchNui('fireMember', formData)
        submitting[member.source] = false;
        
        await loadDataOnMount();
    }

    function disableAddMemberButton() {
        disableAddMember = player_id.trim() === '' || isNaN(parseInt(player_id)) || player_id.split('.').length > 1;
        return disableAddMember;
    }

    async function addNewMember() {
        addingMember = true;
        const formData = {
            player_id: player_id,
            gangName: gangName,
            new_player_role: new_player_role
        }
        //submit data
        addMemberError = await fetchNui('addMember', formData)
        //get addMember submit error -> addMemberError = true
        addingMember = false;
        if(!addMemberError) {
            addMember = false;
            player_id = '';
            await loadDataOnMount();
        }
    }

    function cancelEditingRole(member) {
        const idx = memberList.indexOf(member);

        const oldRole = allRolesList.filter(function (roleData) {
            if(roleData.rank === member.rank) {
                return roleData;
            }
        });

        member.label = oldRole[0].label;

        memberList[idx] = member;

        editingRole[member.source] = !editingRole[member.source]
    }

</script>
<div class="management">
    {#if loadingData}
        <center><div class="loader"></div></center>
    {/if}
    {#if !loadingData}
        <div class="header">
            Current Members ({currentMembersCount})
            {#if isOwner}
                <button class="block bg-green-700 p-1 pr-2 pl-2 rounded-sm hover:bg-green-900" on:click={()=>addMember = !addMember}>Add Members</button>
                {#if addMember}
                    <div class="modal small-modal modal-lg items-center justify-center fade fixed w-full h-full outline-none overflow-y-auto" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog small-modal-dialog flex relative">
                            <div class="modal-content border-none shadow-lg relative flex flex-col w-full pointer-events-auto bg-dark-500 bg-clip-padding rounded-xs outline-none text-current">
                                {#if !addingMember}
                                    <div class="modal-body relative text-white small-modal-body">
                                        <p>Enter Player ID</p>
                                        <div class="block">
                                            <input id="player_id" placeholder="Player ID" name="player_id" bind:value={player_id} class="placeholder-opacity-50 form-input leading-loose rounded-sm text-black mt-2 pl-2" on:keyup={disableAddMemberButton} /><br/>    
                                            <br/>
                                            Rank: <select bind:value={new_player_role} class="bg-transparent rounded-sm mt-2 mb-2 cursor-pointer}">
                                                {#each roleList as role}
                                                    <option class="bg-dark-900/90 text-sm" {role}>{role.rank}</option>
                                                {/each}
                                            </select> <br/>
                                            {#if addMemberError!=''}
                                                <p class="text-xs text-red error-message">{addMemberError}</p>
                                            {/if}
                                            <button class="inline-block hover:text-blue-500" on:click={()=>addMember = false}>Cancel</button>
                                            <button class="inline-block rounded-sm {disableAddMember ? 'cursor-default border border-gray-300 text-gray-800 bg-gray-300' : 'cursor-pointer border border-green-400 text-green-400 hover:text-white hover-bg-green-700'}" disabled={disableAddMember} on:click={addNewMember}>Add</button>
                                        </div>
                                    </div>
                                {/if}
                                {#if addingMember}
                                    <div class="modal-body relative text-white small-modal-body">
                                        <center><div class="button-spinner"></div></center>
                                    </div>
                                {/if}
                            </div>
                        </div>
                    </div>
                {/if}
            {/if}
        </div>
        <div class="mgmt-body">
            {#each memberList as member}
                <div class="member-box justify-items-auto">
                    {#if submitting[member.source]}<center><div class="button-spinner"></div></center>{/if}
                    {#if !submitting[member.source]}
                        <div style="width: {memberBoxColWidth}%; margin-top:0.25vw;">{member.name}</div>
                        {#if isOwner}
                            <div style="width: {memberBoxColWidth}%;">
                                {#if member.rank === ownerRank}
                                    {member.label}
                                {/if}
                                {#if member.rank !== ownerRank}
                                    <select bind:value={member.label} style="margin-left:-0.2vw;" class="bg-transparent rounded-sm mt-2 mb-2 {editingRole[member.source] ? 'cursor-pointer' : 'cursor-default'}" disabled={!editingRole[member.source]}>
                                        {#each roleList as role}
                                            <option class="bg-dark-900/90 text-sm" {role}>{role.label}</option>
                                        {/each}
                                    </select>
                                    {#if editingRole[member.source]}
                                        <p class="inline-block text-sm hover:text-sky cursor-pointer" on:click={() => cancelEditingRole(member)}>
                                            Cancel
                                        </p>
                                    {/if}
                                    {#if !editingRole[member.source]}
                                        <p class="inline-block text-sm hover:text-sky cursor-pointer" on:click={() => editingRole[member.source] = !editingRole[member.source]}>
                                            <Fa icon={faPencil}/>
                                        </p>
                                    {/if}
                                    
                                    {#if editingRole[member.source]}
                                        <p class="inline-block text-sm hover:text-green-600 cursor-pointer" disabled={submitting[member.source]} on:click={() => changeRole(member)}>
                                            Update
                                        </p>
                                    {/if}
                                {/if}
                            </div>
                            {#if member.rank !== ownerRank}   
                                <div>
                                    <button class="text-red-500 hover:bg-red-500 hover:text-white text-md border border-red-700 pl-2 pr-2" on:click={() => showFireModal[member.source] = !showFireModal[member.source]}>
                                        Fire
                                    </button>
                                    {#if showFireModal[member.source]}
                                        <div class="modal small-modal modal-lg items-center justify-center fade fixed w-full h-full outline-none overflow-y-auto" tabindex="-1" aria-hidden="true">
                                            <div class="modal-dialog small-modal-dialog flex relative">
                                                <div class="modal-content border-none shadow-lg relative flex flex-col w-full pointer-events-auto bg-dark-500 bg-clip-padding rounded-xs outline-none text-current">
                                                    <div class="modal-body relative text-white small-modal-body">
                                                        <p>Are you sure you want to fire {member.name} ({member.label})?</p>
                                                        <div class="block">
                                                            <button class="inline-block text-blue-300 hover:text-blue-500" on:click={() => showFireModal[member.source] = false}>Cancel</button>
                                                            <button class="inline-block border border-red-400 text-red-400 hover:text-white hover-bg-red-700 rounded-sm" on:click={() => fireMember(member)}>Confirm</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    {/if}
                                </div>
                            {/if}
                        {/if}
                    {/if}
                    {#if !isOwner}<div>{member.label}</div>{/if}
                </div>
            {/each}
        </div>
    {/if}
</div>
<style>
    .management {
        overflow-y:hidden;
    }

    .header {
        margin-top: 1vw;
        margin-left: 15vw;
    }

    .header > button {
        margin-left: 1.5vw;
        margin-top: 0.5vw;
    }
    .header > div {
        margin-left: -1.5vw;
        margin-top: 0.5vw;
    }

    .mgmt-body {
        margin-top: 1.5vw;
        margin-left: 1vw;
        overflow-y:auto;
        height: 20vw;
    }

    .member-box {
        display: block;
        border: 1px solid #6b7280;
        border-radius: 0.15vw;
        width: 40vw;
        height: 3vw;
        padding-top: 0.5vw;
        margin-bottom: 0.75vw;
        background-color: rgba(45, 45, 45, 0.5);
    }

    .member-box > div {
        display: inline-block;
        text-align: left;
        padding-left: 1vw;
    }

    .member-box:hover {
        background-color: rgba(28, 25, 23, 0.5);
    }

    .small-modal-dialog {
        height: 16vw;
        width: 29vw;
    }
</style>