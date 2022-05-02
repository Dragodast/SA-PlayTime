local QBCore = exports['qb-core']:GetCoreObject()

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