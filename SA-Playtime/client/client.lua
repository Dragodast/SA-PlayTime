local playerloaded = false
local increasement = 1000 * 60 * Config.ThreadIncrease

local function IncreasePlayTime()
    if playerloaded then return end
    playerloaded = true

    while playerloaded do
        Wait(increasement)
        TriggerServerEvent('PlayTime:Server:Increase', '5')
    end
end


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    CreateThread(function()
        IncreasePlayTime()
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    playerloaded = false
end)
