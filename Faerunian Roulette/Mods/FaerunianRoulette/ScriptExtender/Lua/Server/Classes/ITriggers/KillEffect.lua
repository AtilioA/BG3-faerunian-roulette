Effects.KillEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
    -- Play effects on the character for the death
    Osi.PlayEffect(character, Config:getCfg().FEATURES.trigger_effect.sound_effect.sound)
    Osi.PlayEffect(character, "44c46f2c-caba-ddbf-c1b5-1af6e245356f")

    Osi.Die(character)
    FRPrint(1, character .. " has been killed.")
  end
})
