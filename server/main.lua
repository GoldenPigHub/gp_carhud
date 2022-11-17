exports['qbr-core']:AddCommand('cash', 'Check Cash Balance', {}, false, function(source, args)
    local Player = exports['qbr-core']:GetPlayer(source)
    local cashamount = Player.PlayerData.money.cash
    -- Put your own notification type here
    TriggerClientEvent('gp_notify:client:SendAlert', source, { text = "Cash: $" .. cashamount, lenght = '2500'})
end)

exports['qbr-core']:AddCommand('bank', 'Check Bank Balance', {}, false, function(source, args)
    local Player = exports['qbr-core']:GetPlayer(source)
    local bankamount = Player.PlayerData.money.bank
    -- Put your own notification type here
    TriggerClientEvent('gp_notify:client:SendAlert', source, { text = "Bank: $" .. bankamount, lenght = '2500'})
end)

RegisterServerEvent('hud:server:GainThirst')
AddEventHandler('hud:server:GainThirst', function(amount)
    local src = source
    local Player = exports['qbr-core']:GetPlayer(src)
    local newThirst
    if Player ~= nil then
            if Player.PlayerData.metadata['thirst'] == nil then
                Player.PlayerData.metadata['thirst'] = 0
            end
            local thirst = Player.PlayerData.metadata['thirst']
            if newThirst <= 0 then
                newThirst = 0
            end
            if newThirst > 100 then
                newThirst = 100
            end
        Player.Functions.SetMetaData('thirst', newThirst)
        TriggerClientEvent('hud:client:UpdateThirst', src, newThirst)
	end
end)
