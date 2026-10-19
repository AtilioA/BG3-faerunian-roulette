Effects.StatusEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
    local maxDuration = Config:getCfg().FEATURES.trigger_effect.apply_status.max_duration - 1
    local duration = Ext.Math.Random(1, maxDuration)
    local durationInTurns = (duration + 1) * 6
    -- STUB: replace with a random status effect from StatusList.lua
    local randomStatus = StatusList:GetRandomItem()
    local ignoreResistances = Config:getCfg().FEATURES.trigger_effect.apply_status.ignore_resistances and 100 or 0

    Osi.ApplyStatus(character, randomStatus, durationInTurns, ignoreResistances)
    FRDebug(1, "Applied " .. randomStatus .. " status effect to " .. character .. " for " .. duration .. " turns.")
  end
})
