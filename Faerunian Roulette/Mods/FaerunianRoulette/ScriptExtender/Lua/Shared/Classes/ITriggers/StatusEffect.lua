Effects.StatusEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
    local maxDuration = Config:getCfg().trigger_effect.status.max_duration
    local duration = Ext.Math.Random(1, maxDuration)
    local durationInTurns = duration * 6
    -- STUB: replace with a random status effect from StatusList.lua
    local randomStatus = "BLEEDING" -- Statuses:GetRandomStatus()
    local ignoreResistances = Config:getCfg().trigger_effect.status.ignore_resistances and 100 or 0

    Osi.ApplyStatus(character, randomStatus, durationInTurns, ignoreResistances)
    FRDebug(1, "Applied " .. randomStatus .. " status effect to " .. character .. " for " .. duration .. " turns.")
  end
})
