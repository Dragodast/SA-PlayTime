local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('PlayTime:Server:Increase', function(k)
    if k ~= '5' then return end

    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    Player.PlayerData.metadata['playtime'] = Player.PlayerData.metadata['playtime'] or 0
    local playtime = tonumber(Player.PlayerData.metadata['playtime'])
    playtime = playtime + Config.ThreadIncrease

    Player.Functions.SetMetaData('playtime', playtime)
end)

RegisterCommand(Config.Command, function(source)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    if xPlayer.PlayerData.metadata.playtime then
        local playtime = xPlayer.PlayerData.metadata.playtime

        local days = math.floor(playtime / 1440)
        playtime = playtime - days * 1440
        local hours = math.floor(playtime / 60 )
        playtime = playtime - hours * 60
        local minutes = math.floor(playtime)

        local totalplaytime = string.format("%d days, %d hours, %d minutes.",days,hours,minutes)
        TriggerClientEvent('QBCore:Notify', source, Lang:t('success.playtime') .. totalplaytime, 'success') --Lang:t('success.playtime')
    end
end)