local blips = {
  
  {title="Arcade Arena", colour=1, id=740, scale = 1.0, x = -1651.2318115234, y = -1082.3436279297, z = 13.154672622681}, -- Arcade Arena
  {title="Rental", colour=50, id=326, scale = 0.6, x = 109.86, y = -1087.58, z = 29.30},
}

--[[ Citizen.CreateThread(function()
      for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, info.scale)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	    BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end) ]]