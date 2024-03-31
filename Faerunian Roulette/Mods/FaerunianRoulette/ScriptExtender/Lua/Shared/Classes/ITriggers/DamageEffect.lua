Effects.DamageEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
    -- Play effects on the character for the damage
    Osi.PlayEffect(character, "dee8060b-c1c2-7343-db76-dd7f2cd36e24")
    Osi.PlayEffect(character, "44c46f2c-caba-ddbf-c1b5-1af6e245356f")

    local maxHP = Osi.GetMaxHitpoints(character)
    -- Get max damage, between 0 and Config:getCfg().FEATURES.trigger_effect.damage.max_percentage
    local maxDamage = math.floor(maxHP * Config:getCfg().FEATURES.trigger_effect.damage.max_percentage / 100)
    -- Get random damage, between 0 and maxDamage
    local damage = math.random(0, maxDamage)

    Osi.ApplyDamage(character, damage, "FaerunianRoulette")
    FRPrint(1, character .. " has been damaged for " .. damage .. " points.")
  end
})
