function CheckTargetResource()
	if GetResourceState("ox_target"):match("start") then
		return "ox"
	elseif GetResourceState("qb-target"):match("start") then
		return "qb"
	end
	return nil
end

---Setup Target
---@param type 'shell' | 'mlo' | nil
---@param usecase 'stash' | 'logout' | 'exit' |'outfit' | 'enter' | 'ped'
---@param data table
function SetupTarget(type, usecase, data)
	if not data or not usecase then
		return nil
	end
	local targetname = CheckTargetResource()
	if not targetname then
		return error("No TARGET resource found!")
	end
	local motelData = data[1]
	local motel = motelData.motel
	local room = motelData.room
	local targetData = data[2]
	local options = {}
	if targetname == "qb" then
		local qbtarget = exports["qb-target"]
		if usecase == "ped" then
			return qbtarget:AddTargetEntity(targetData.ped, {
				options = {
					{
						name = string.format("lazy_motel_openmenu_%s", motel),
						label = locale("label_motel"),
						icon = "fas fa-home",
						action = function()
							ToggleMenu(true, motel)
							-- ToggleMenu(true, motel)
						end,
					},
				},
				distance = 1.5,
			})
		elseif usecase == "stash" then
			table.wipe(options)
			options = {
				{
					name = "lazy_openstash",
					icon = Config.Icon.stash,
					label = locale("label_stash"),
					action = function()
						if not Config.Motel[motel].motel[room].stash.locked then
							Anim()
							TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)
							Wait(100)
							OpenMotelInventory(motel, room)
						else
							Notification(locale("error_stash_locked"))
						end
					end,
				},
				{
					name = "lazy_stash_lock",
					icon = Config.Icon.lock,
					label = locale("label_stash_lock"),
					canInteract = function()
						return not Config.Motel[motel].motel[room].stash.locked
					end,
					action = function()
						if not IsKeyHolders(motel, room) then
							return Notification("You don't have the key...", "error")
						end
						Anim()
						TriggerServerEvent("lazy-motel:server:toggleStash", motel, room)
					end,
				},
				{
					name = "lazy_stash_unlock",
					icon = Config.Icon.unlock,
					label = locale("label_stash_unlock"),
					canInteract = function()
						return Config.Motel[motel].motel[room].stash.locked
					end,
					action = function()
						if not IsKeyHolders(motel, room) then
							return Notification("You don't have the key...", "error")
						end
						Anim()
						TriggerServerEvent("lazy-motel:server:toggleStash", motel, room)
					end,
				},
				{
					name = "lazy_stash_lockpick",
					icon = Config.Icon.lock,
					label = "Lockpick stash",
					canInteract = function()
						local config = Config.Motel[motel]
						local roomconfig = config and Config.Motel[motel].motel[room]
						return roomconfig and roomconfig.raid and roomconfig.stash.locked
					end,
					action = function()
						local job = Functions.GetJob()
						if not job then
							return
						end
						if not Config.Police[job.name] then
							return
						end
						StartLockpick(motel, room)
					end,
				},
			}
		elseif usecase == "outfit" then
			table.wipe(options)
			options = {
				{
					name = ("lazy_outfit:%s"):format(room),
					icon = Config.Icon.outfit,
					label = locale("label_outfit"),
					action = function()
						OpenOutfitMenu()
					end,
				},
			}
		elseif usecase == "logout" then
			table.wipe(options)
			options = {
				{
					name = ("lazy_logout:%s"):format(room),
					event = "lazy-motel:client:logout",
					icon = Config.Icon.logout,
					label = locale("label_logout"),
					canInteract = function()
						return IsKeyHolders(motel, room)
					end,
				},
			}
		elseif usecase == "exit" then
			table.wipe(options)
			options = {
				{
					name = "lazy_exit" .. room,
					label = locale("label_exit"),
					icon = Config.Icon.exit,
					action = function()
						LeaveMotel(motel, room)
					end,
				},
				{
					name = "lazy_lock_door",
					icon = Config.Icon.lock_door,
					label = locale("label_lock_motel"),
					action = function()
						TriggerServerEvent("lazy-motel:server:toggleDoorState", motel, room)
						if not GetResourceState("qb-doorlock"):match("start") then
							Anim()
						end
					end,
					canInteract = function()
						if not IsKeyHolders(motel, room) then
							return Notification("You don't have the key...", "error")
						end
						return not Config.Motel[motel].motel[room].locked
					end,
				},
				{
					name = "lazy_unlock_door",
					icon = Config.Icon.unlock_door,
					label = locale("label_unlock_motel"),
					action = function()
						if not IsKeyHolders(motel, room) then
							return Notification("You don't have the key...", "error")
						end
						TriggerServerEvent("lazy-motel:server:toggleDoorState", motel, room)
						if not GetResourceState("qb-doorlock"):match("start") then
							Anim()
						end
					end,
					canInteract = function()
						return Config.Motel[motel].motel[room].locked
					end,
				},
				{
					name = "lazy_motel_inside_menu",
					icon = Config.Icon.inside_menu,
					label = locale("label_inside_menu"),
					action = function()
						OpenInsideMenu(motel, room)
					end,
					canInteract = function()
						return IsKeyHolders(motel, room)
					end,
				},
			}
		end
		return qbtarget:AddBoxZone(
			string.format("%s:%s:%s", usecase, motelData.motel, motelData.room),
			targetData.coords,
			targetData.size.x,
			targetData.size.y,
			{
				name = string.format("%s:%s:%s", usecase, motelData.motel, motelData.room),
				heading = targetData.rotation,
				debugPoly = false,
				minZ = targetData.coords.z - targetData.size.z,
				maxZ = targetData.coords.z + targetData.size.z,
			},
			{
				options = options,
				distance = 1.5,
			}
		)
	elseif targetname == "ox" then
		local ox_target = exports.ox_target
		if usecase == "ped" then
			return ox_target:addLocalEntity(targetData.ped, {
				{
					name = ("lazy_motel_openmenu_%s"):format(motel),
					label = locale("label_motel"),
					icon = "fas fa-home",
					onSelect = function()
						ToggleMenu(true, motel)
					end,
					canInteract = function(_, distance)
						return distance <= 1.5
					end,
				},
			})
		end
		if usecase == "stash" then
			table.wipe(options)
			options = {
				{
					name = "lazy_openstash",
					icon = Config.Icon.stash,
					label = locale("label_stash"),
					onSelect = function()
						if not Config.Motel[motel].motel[room].stash.locked then
							Anim()
							TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)
							Wait(100)
							OpenMotelInventory(motel, room)
						else
							Notification(locale("error_stash_locked"))
						end
					end,
					canInteract = function(_, distance)
						return distance <= 2.5
					end,
				},
				{
					name = "lazy_stash_lock",
					icon = Config.Icon.lock,
					label = locale("label_stash_lock"),
					canInteract = function(_, distance)
						return not Config.Motel[motel].motel[room].stash.locked and distance < 2.5
					end,
					onSelect = function()
						if not IsKeyHolders(motel, room) then
							return Notification("You don't have the key...", "error")
						end
						Anim()
						TriggerServerEvent("lazy-motel:server:toggleStash", motel, room)
					end,
				},
				{
					name = "lazy_stash_unlock",
					icon = Config.Icon.unlock,
					label = locale("label_stash_unlock"),
					canInteract = function(_, distance)
						return Config.Motel[motel].motel[room].stash.locked and distance < 2.5
					end,
					onSelect = function()
						if not IsKeyHolders(motel, room) then
							return Notification("You don't have the key...", "error")
						end
						TriggerServerEvent("lazy-motel:server:toggleStash", motel, room)
					end,
				},
				{
					name = "lazy_stash_lockpick",
					icon = Config.Icon.lock,
					label = "Lockpick stash",
					canInteract = function(_, distance)
						local config = Config.Motel[motel]
						local roomconfig = config and Config.Motel[motel].motel[room]
						return roomconfig and roomconfig.raid and roomconfig.stash.locked and distance < 2.5
					end,
					onSelect = function()
						local job = Functions.GetJob()
						if not job then
							return
						end
						if not Config.Police[job.name] then
							return
						end
						StartLockpick(motel, room)
					end,
				},
			}
		elseif usecase == "outfit" then
			table.wipe(options)
			options = {
				{
					name = "lazy_outfit:" .. room,
					icon = Config.Icon.outfit,
					label = locale("label_outfit"),
					onSelect = function()
						OpenOutfitMenu()
					end,
					canInteract = function(_, distance)
						return distance < 2.0
					end,
				},
			}
		elseif usecase == "logout" then
			table.wipe(options)
			options = {
				{
					name = "lazy_logout" .. room,
					event = "lazy-motel:client:logout",
					icon = Config.Icon.logout,
					label = locale("label_logout"),
					canInteract = function(_, distance)
						return IsKeyHolders(motel, room) and distance < 2.5
					end,
				},
			}
		elseif usecase == "exit" and type == "shell" then
			table.wipe(options)
			options = {
				{
					name = "lazy_exit" .. room,
					label = locale("label_exit"),
					icon = Config.Icon.exit,
					onSelect = function()
						LeaveMotel(motel, room)
					end,
					canInteract = function(_, distance)
						return distance < 1.5
					end,
				},
				{
					name = "lazy_lock_door",
					icon = Config.Icon.lock_door,
					label = locale("label_lock_motel"),
					onSelect = function()
						TriggerServerEvent("lazy-motel:server:toggleDoorState", motel, room)
						if not GetResourceState("qb-doorlock"):match("start") then
							Anim()
						end
					end,
					canInteract = function(_, distance)
						if not IsKeyHolders(motel, room) then
							return Notification("You don't have the key...", "error")
						end
						return not Config.Motel[motel].motel[room].locked and distance < 2.5
					end,
				},
				{
					name = "lazy_unlock_door",
					icon = Config.Icon.unlock_door,
					label = locale("label_unlock_motel"),
					onSelect = function()
						if not IsKeyHolders(motel, room) then
							return Notification("You don't have the key...", "error")
						end
						TriggerServerEvent("lazy-motel:server:toggleDoorState", motel, room)
						if not GetResourceState("qb-doorlock"):match("start") then
							Anim()
						end
					end,
					canInteract = function(_, distance)
						return Config.Motel[motel].motel[room].locked and distance < 1.5
					end,
				},
				{
					name = "lazy_motel_inside_menu",
					icon = Config.Icon.inside_menu,
					label = locale("label_inside_menu"),
					onSelect = function()
						OpenInsideMenu(motel, room)
					end,
					canInteract = function(_, distance)
						return IsKeyHolders(motel, room) and distance < 1.5
					end,
				},
			}
		end
		return ox_target:addBoxZone({
			coords = targetData.coords,
			size = targetData.size,
			rotation = targetData.rotation,
			debug = false,
			options = options,
		})
	end
end
