MLOZone = {}

---Setup Zone for mlo motel
---@param motel string
---@param room string
function SetupMLOZone(motel, room)
	if not MLOZone[motel] then
		MLOZone[motel] = {}
	end
	if MLOZone[motel][room] then
		return
	end
	local MotelConfig = Config.Motel[motel].motel[room]
	if not MotelConfig then
		return
	end
	local usingTarget = MotelConfig.Target or Config.Target
	-- Stash
	local StashConfig = MotelConfig.stash
	local stash

	-- Outfit
	local OutfitConfig = MotelConfig.outfit
	local outfit

	-- Logout
	local LogoutConfig = MotelConfig.logout
	local logout

	if usingTarget.stash then
		local data = {
			[1] = {
				motel = motel,
				room = room,
			},
			[2] = StashConfig,
		}
		stash = {
			type = "target",
			data = SetupTarget("mlo", "stash", data),
		}
	else
		local enter = function()
			if IsKeyHolders(motel, room) then
				ShowDrawtext("[E] Open Stash  \n[G] Lock/Unlock Stash")
			else
				ShowDrawtext("[E] Open Stash")
			end
		end

		local exit = function()
			HideDrawtext()
		end

		local inside = function()
			if IsControlJustPressed(0, 46) then
				if not Config.Motel[motel].motel[room].stash.locked then
					Anim()
					TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)
					Wait(100)
					OpenMotelInventory(motel, room)
					HideDrawtext()
				else
					Notification(locale("error_stash_locked"))
				end
			elseif IsControlJustPressed(0, 47) then
				if not IsKeyHolders(motel, room) then
					return Notification("You don't have the key...", "error")
				end
				-- HideDrawtext()
				Anim()
				TriggerServerEvent("lazy-motel:server:toggleStash", motel, room)
			end
		end

		stash = {
			type = "zone",
			data = SetupZone(StashConfig, {
				enter = enter,
				exit = exit,
				inside = inside,
			}),
		}
	end
	if usingTarget.outfit then
		outfit = SetupTarget("mlo", "outfit", {
			[1] = {
				motel = motel,
				room = room,
			},
			[2] = OutfitConfig,
		})
	else
		local function OnEnter()
			ShowDrawtext("[E] Open Wardobe")
		end
		local function OnExit()
			HideDrawtext()
		end
		local function Inside()
			if IsControlJustPressed(0, 46) then
				OpenOutfitMenu()
			end
		end
		outfit = SetupZone(OutfitConfig, { enter = OnEnter, exit = OnExit, inside = Inside })
	end
	if usingTarget.logout then
		logout = {
			type = "target",
			data = SetupTarget("mlo", "logout", {
				[1] = {
					motel = motel,
					room = room,
				},
				[2] = LogoutConfig,
			}),
		}
	elseif not usingTarget.logout then
		local function enter()
			ShowDrawtext("[E] Logout")
		end
		local function inside() end
		if IsControlJustPressed(0, 46) then
			if IsKeyHolders(motel, room) then
				TriggerEvent("lazy-motel:client:logout")
			end
		end
		local function exit()
			HideDrawtext()
		end
		logout = {
			type = "zone",
			data = SetupZone(LogoutConfig, { enter = enter, exit = exit, inside = inside }),
		}
	end
	MLOZone[motel][room] = {
		stash = stash,
		outfit = outfit,
		logout = logout,
	}
end

---Remove Zone for mlo motel
---@param motel string
---@param room string
function RemoveMLOZone(motel, room)
	if not MLOZone[motel] then
		MLOZone[motel] = {}
	end
	if not MLOZone[motel][room] then
		return
	end
	for _, v in pairs(MLOZone[motel][room]) do
		if type(v) == "table" then
			if v.type == "zone" then
				local success, _ = pcall(v.data.remove)
				if not success then
					print(("Can't remove the zone, %s %s").format(motel, room))
				end
			elseif v.type == "target" then
				local target = CheckTargetResource()
				if target == "qb" then
					exports["qb-target"]:RemoveZone(v.data.name)
				elseif target == "ox" then
					exports.ox_target:removeZone(v.data)
				end
			end
		end
	end
	MLOZone[motel][room] = nil
end

function SetupEnterZone()
	for k, v in pairs(Config.Motel) do
		for motel, value in pairs(v.motel) do
			lib.zones.box({
				coords = value.enter.xyz,
				size = vector3(1.5, 1.5, 2.0),
				rotation = value.enter.w,
				onEnter = function()
					NearestMotel = k
					NearestDoor = motel
					if v.type == "shell" then
						ShowDrawtext(locale("info_enter", Config.Motel[k].motel[motel].label))
						TriggerServerEvent("lazy-motel:server:playernearby", k, motel)
					end
				end,
				onExit = function()
					-- NearestDoor = nil
					-- NearestMotel = nil
					HideDrawtext()
					TriggerServerEvent("lazy-motel:server:removenearby", k, motel)
				end,
				inside = function()
					if v.type == "shell" then
						if IsControlJustReleased(0, KeyBind) then
							if IsKeyHolders(k, motel) or not Config.Motel[k].motel[motel].locked then
								EnterMotel(k, motel)
							elseif Config.Motel[k].motel[motel].owned and not IsKeyHolders(k, motel) then
								OpenDoorMenu(k, motel)
							elseif not Config.Motel[k].motel[motel].owned then
								Notification(locale("error_locked"), "error")
							end
						end
					end
				end,
			})
		end
	end
end

---@param data {name: string, coords: vector3, size: vector3, rotation: number}
---@param cb {enter: function, inside: function, exit: function}
function SetupZone(data, cb)
	return lib.zones.box({
		coords = data.coords,
		size = data.size,
		rotation = data.rotation,
		debug = false,
		inside = cb.inside,
		onEnter = cb.enter,
		onExit = cb.exit,
	})
end
