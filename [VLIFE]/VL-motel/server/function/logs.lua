local function FormatEmbeds(type, data)
	if type == "rent" then
	end
end

function SendLogs(title, message, important)
	local webhook = GetConvar(
		"lazy-motel:log",
		""
	)
	if not webhook then return end
	-- Red / Blurple
	local color = important and 0xFF0000 or 0x5865F2
	local data = {
		embeds = { {
			title = title,
			description = "Description",
			color = color,
		} },
	}
	if important then
		data.content = "@everyone"
	end
	local headers = {
		["Content-Type"] = "application/json",
	}
	PerformHttpRequest(webhook, function(statusCode, response, headers)
		if statusCode ~= 204 then
			print("Failed to send Discord webhook. Status code: " .. statusCode)
		end
	end, "POST", json.encode(data), headers)
end
