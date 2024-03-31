Effects.HealEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
    local currentHP = Osi.GetHitpoints(character)
    local maxHP = Osi.CharacterGetHitpointsMax(character)
    local maxHeal = math.floor(maxHP * Config:getCfg().FEATURES.trigger_effect.heal.max_percentage / 100)
    local heal = math.random(0, maxHeal)

    Osi.SetHitpoints(character, currentHP + heal)

    FRPrint(1, character.name .. " has been healed for " .. heal .. " hit points.")
  end
})
