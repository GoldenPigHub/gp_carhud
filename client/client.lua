Show = false
local hunger = 100
local thirst = 100

RegisterNetEvent('hud:client:UpdateNeeds')
AddEventHandler('hud:client:UpdateNeeds', function(newHunger, newThirst)
    hunger = newHunger
    thirst = newThirst
end)

RegisterNetEvent('hud:client:UpdateThirst')
AddEventHandler('hud:client:UpdateThirst', function(newThirst)
    thirst = newThirst
end)

Citizen.CreateThread(function()
    Show = true
    Citizen.Wait(1000)
    UI()
    while true do
        if Config.HideAmmo then
            Citizen.InvokeNative(0x4CC5F2FC1332577F, GetHashKey("HUD_CTX_INFINITE_AMMO"))
        end
        Citizen.InvokeNative(0x4CC5F2FC1332577F, GetHashKey("HUD_CTX_GOLD_CURRENCY_CHANGE"))
        Citizen.InvokeNative(0x4CC5F2FC1332577F, GetHashKey("HUD_CTX_SHARP_SHOOTER_EVENT"))
        Citizen.InvokeNative(0x4CC5F2FC1332577F, GetHashKey("HUD_CTX_RESTING_BY_FIRE"))
        Citizen.InvokeNative(0x4CC5F2FC1332577F, GetHashKey("HUD_CTX_INFO_CARD"))
        Citizen.InvokeNative(0xD4EE21B7CC7FD350, false)
        Citizen.InvokeNative(0x50C803A4CD5932C5, false)
        local player = PlayerPedId()

        if GetMount(player) ~= 0 then
            SendNUIMessage({ action = "horseui", show = true })
        else
            SendNUIMessage({ action = "horseui", show = false })
        end

        SendNUIMessage({
            action = 'tick',
            heal = GetEntityHealth(player) / 3,
            stamina = Citizen.InvokeNative(0x36731AC041289BB1, player, 1),
            thirst = thirst,
            hunger = hunger,
            horsestamina = Citizen.InvokeNative(0x36731AC041289BB1, GetMount(player), 1)
        })
        Citizen.Wait(200)
    end
end)

function UI()
    Citizen.CreateThread(function()
        while Show do
            Citizen.Wait(500)
            if IsPauseMenuActive() then
                SendNUIMessage({ action = "ui", show = false })
            elseif not IsPauseMenuActive() then
                SendNUIMessage({ action = "ui", show = true })
            end
        end
    end)
end
