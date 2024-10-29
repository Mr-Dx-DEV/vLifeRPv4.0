local copRelation = `COP`

function ShootPlayer(entity)
    FreezeEntityPosition(entity, false)
    Wait(100)
    SetPedAsCop(entity, true)
    SetRelationshipBetweenGroups(5, copRelation, `PLAYER`)
    SetRelationshipBetweenGroups(0, copRelation, copRelation)
    SetPedRelationshipGroupHash(entity, copRelation)
    SetCanAttackFriendly(entity, false, false)
    GiveWeaponToPed(entity, GetHashKey("weapon_pistol"), 9999, false, true)
    SetCurrentPedWeapon(entity, GetHashKey("weapon_pistol"), true)
    SetPedAmmo(entity, GetHashKey("weapon_pistol"), 9999)
    SetAmmoInClip(entity, GetHashKey("weapon_pistol"), 9999)

    SetPedCombatAttributes(entity, 0, true) --[[ BF_CanUseCover ]]
    SetPedCombatAttributes(entity, 5, true) --[[ BF_CanFightArmedPedsWhenNotArmed ]]
    SetPedCombatAttributes(entity, 46, true) --[[ BF_AlwaysFight ]]
    SetCanAttackFriendly(entity, false, true)
    SetPedSeeingRange(entity, 300.0)
    SetPedHearingRange(entity, 300.0)
    SetPedAlertness(entity, 3)

    SetPedCombatMovement(entity, 2)
    SetPedCombatRange(entity, 2)
    SetPedAccuracy(entity, 80)
    TaskShootAtEntity(entity, PlayerPedId(), 250000, `FIRING_PATTERN_FULL_AUTO`)
end
