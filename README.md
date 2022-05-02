# SA-PlayTime

Basic script for counting PlayTime ingame. So first what we need to edit is QB-Core where we add to QB-Core > Server > player.lua
Somewhere in metadata (for example line 70)
```PlayerData.metadata['playtime'] = PlayerData.metadata['playtime'] or 0```

and now we need to add to event which will increase that value every time what we have set in QB-Core
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
        Player.PlayerData.metadata['playtime'] = playtimen + 5
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

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/donate/?hosted_button_id=D2C3TTRXZSUQN)

