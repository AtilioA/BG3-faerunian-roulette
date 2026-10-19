RequireFiles("Server/", {
    "Classes/_Init",
    "SubscribedEvents",
    "EventHandlers",
})

RouletteGame = _MetaClass.New(FaerunianRoulette)
-- Wrap the instance with the debugging layer
if Config:getCfg().DEBUG.level > 1 then
    RouletteGame = _MetaClass._Debug(RouletteGame)
end

SubscribedEvents.SubscribeToEvents()
