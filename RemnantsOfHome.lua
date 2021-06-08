RemnantsOfHome = {}
RemnantsOfHome.Name = "RemnantsOfHome"
RemnantsOfHome.Author = "jeremy.rm"

function RemnantsOfHome.JumpToROHGuildHall()
	if CanJumpToHouseFromCurrentLocation() then
		JumpToSpecificHouse("@ROHGuildHouse", 47)
	else
		CHAT_ROUTER:AddSystemMessage("You cannot teleport from this location.")
	end
end

local function OnEventAddOnLoaded(event, args)
	if args ~= RemnantsOfHome.Name then return end
	EVENT_MANAGER:UnregisterForEvent(RemnantsOfHome.Name, EVENT_ADD_ON_LOADED)
	SLASH_COMMANDS["/roh"]=RemnantsOfHome.JumpToROHGuildHall
end

local function OnEventPlayerActivated()
		EVENT_MANAGER:UnregisterForEvent(RemnantsOfHome.Name, EVENT_PLAYER_ACTIVATED)
		CHAT_ROUTER:AddSystemMessage(zo_strformat("<<1>> by <<2>> initialized, use /roh to teleport to the Remnants of Hope Guild Hall.", RemnantsOfHome.Name, RemnantsOfHome.Author))
end

EVENT_MANAGER:RegisterForEvent(RemnantsOfHome.Name, EVENT_ADD_ON_LOADED, OnEventAddOnLoaded)
EVENT_MANAGER:RegisterForEvent(RemnantsOfHome.Name, EVENT_PLAYER_ACTIVATED, OnEventPlayerActivated)
