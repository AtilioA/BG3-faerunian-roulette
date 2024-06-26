setmetatable(Mods.FaerunianRoulette, { __index = Mods.VolitionCabinet })

---Ext.Require files at the path
---@param path string
---@param files string[]
function RequireFiles(path, files)
    for _, file in pairs(files) do
        Ext.Require(string.format("%s%s.lua", path, file))
    end
end

RequireFiles("Shared/", {
    "MetaClass",
    "Helpers/_Init",
    "Classes/_Init",
    "SubscribedEvents",
    "EventHandlers",
})

local VCModuleUUID = "f97b43be-7398-4ea5-8fe2-be7eb3d4b5ca"
if (not Ext.Mod.IsModLoaded(VCModuleUUID)) then
    Ext.Utils.Print("VOLITION CABINET HAS NOT BEEN LOADED. PLEASE MAKE SURE IT IS ENABLED IN YOUR MOD MANAGER.")
end

local MODVERSION = Ext.Mod.GetMod(ModuleUUID).Info.ModVersion
if MODVERSION == nil then
    FRWarn(0, "Volitio's Faerûnian Roulette loaded (version unknown)")
else
    -- Remove the last element (build/revision number) from the MODVERSION table
    table.remove(MODVERSION)

    local versionNumber = table.concat(MODVERSION, ".")
    FRPrint(0, "Volitio's Faerûnian Roulette version " .. versionNumber .. " loaded")
end

RouletteGame = _MetaClass.New(FaerunianRoulette)
-- Wrap the instance with the debugging layer
if Config:getCfg().DEBUG.level > 1 then
    RouletteGame = _MetaClass._Debug(RouletteGame)
end

SubscribedEvents.SubscribeToEvents()
