# SA-PlayTime

Basic script for counting PlayTime ingame. So first what we need to edit is QB-Core where we add to QB-Core > Server > player.lua this lines
somewhere in metadata (for example line 70)
```PlayerData.metadata['playtime'] = PlayerData.metadata['playtime'] or 0```

and now we need to add this to QB-Core > server > events.lua ```local playtimen = tonumber(playtimes) -- 5=5 minutes
        Player.PlayerData.metadata['playtime'] = playtimen + QBConfig.UpdateInterval``` to increase that value every time what we have set.
QB-Core > server > events.lua 
```
RegisterNetEvent('QBCore:UpdatePlayer', function(PlayerData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local newHunger = Player.PlayerData.metadata['hunger'] - QBCore.Config.Player.HungerRate
        local newThirst = Player.PlayerData.metadata['thirst'] - QBCore.Config.Player.ThirstRate
        local playtimes = Player.PlayerData.metadata['playtime']
        local playtimen = tonumber(playtimes) -- 5=5 minutes
        Player.PlayerData.metadata['playtime'] = playtimen + QBConfig.UpdateInterval
        if newHunger <= 0 then
            newHunger = 0
        end
        if newThirst <= 0 then
            newThirst = 0
        end
        Player.Functions.SetMetaData('thirst', newThirst)
        Player.Functions.SetMetaData('hunger', newHunger)
        TriggerClientEvent('hud:client:UpdateNeeds', src, newHunger, newThirst)
        Player.Functions.Save()
    end
end)
```

That's all now it will work. Playtime is editable in MySQL

Newer and better version [PAID] : https://studio-players.tebex.io/
Support: https://discord.gg/5Xpa4wEehD

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/donate/?hosted_button_id=D2C3TTRXZSUQN)

