Effects.HealEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
    local currentHP = Osi.GetHitpoints(character)
    -- local currentHPPercentage = Osi.GetHitpointsPercentage(character)
    -- local maxHP = (currentHP / currentHPPercentage) * 100
    -- local maxHeal = math.floor(maxHP * Config:getCfg().FEATURES.trigger_effect.heal.max_percentage / 100)
    -- local heal = math.random(0, maxHeal)

    Osi.ApplyStatus(character, "HEAL", 1, 100)
    -- Osi.SetHitpoints(character, currentHP + heal)

    FRPrint(1, character .. " has been healed")
  end
})
