SubscribedEvents = {}

function SubscribedEvents.SubscribeToEvents()
  if Config:getCfg().GENERAL.enabled then
    FRDebug(2, "Subscribing to events with JSON config: " .. Ext.Json.Stringify(Config:getCfg(), { Beautify = true }))

    -- Event subscriptions
    Ext.Osiris.RegisterListener("TurnEnded", 1, "after", EHandlers.OnTurnEnded)

    Ext.Osiris.RegisterListener("TurnStarted", 1, "after", EHandlers.OnTurnStarted)

    -- Ext.Osiris.RegisterListener("TimerFinished", 1, "after", EHandlers.OnTimerFinished)
  end
end

return SubscribedEvents
