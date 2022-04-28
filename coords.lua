local display = false
local coordsVisible = false

RegisterCommand("coords", function()
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(PlayerPedId())
        local playerH = GetEntityHeading(playerPed)
        local x = string.sub(playerCoords.x, 0, 8) 
        local y = string.sub(playerCoords.y, 0, 8)
        local z = string.sub(playerCoords.z, 0, 6)
        local h = FormatCoord(playerH, 0, 6)
        rare5mCoords('rare5m', 'x = ' .. x .. ', y = ' .. y .. ', z = ' .. z)
        rare5mcoordsNormal('normal', x .. ', ' .. y .. ', ' .. z)
        rare5mcoordsVector3('vector3', 'vector3(' .. x .. ', ' .. y .. ', ' .. z .. ')')
        rare5mcoordsVector4('vector4', 'vector4(' .. x .. ', ' .. y .. ', ' .. z .. ', ' .. h .. ')')
        SetDisplay(not display)
end)

function rare5mCoords(type, text)
	SendNUIMessage({
        type = type,
		text = text
	})
end

function rare5mcoordsNormal(type, text)
    SendNUIMessage({
        type = type,
		text = text
	})
end

function rare5mcoordsVector3(type, text)
    SendNUIMessage({
        type = type,
		text = text
	})
end


function rare5mcoordsVector4(type, text)
    SendNUIMessage({
        type = type,
		text = text
	})
end

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

RegisterNUICallback("rare5mcloseButton", function(data)
    SetNuiFocus(false, false)
    SetDisplay(false)
end)

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display)
        DisableControlAction(0, 2, display)
        DisableControlAction(0, 142, display)
        DisableControlAction(0, 18, display)
        DisableControlAction(0, 322, display)
        DisableControlAction(0, 106, display)
    end
end)

function DrawGenericText(text)
	SetTextColour(186, 186, 186, 255)
	SetTextFont(7)
	SetTextScale(0.378, 0.378)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(true)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.40, 0.00)
end

Citizen.CreateThread(function()
    while true do
		local sleepThread = 250
		
		if coordsVisible then
			sleepThread = 5

			local playerPed = PlayerPedId()
			local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
			local playerH = GetEntityHeading(playerPed)

			DrawGenericText(("~g~Heading~w~: %s"):format(FormatCoord(playerH)))
		end

		Citizen.Wait(sleepThread)
	end
end)

FormatCoord = function(coord)
	if coord == nil then
		return "unknown"
	end

	return tonumber(string.format("%.2f", coord))
end

ToggleCoords = function()
	coordsVisible = not coordsVisible
end

RegisterCommand("heading", function()
    ToggleCoords()
end)