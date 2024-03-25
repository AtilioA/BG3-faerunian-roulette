Effects.KillEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
    Osi.PlayEffect(character, "dee8060b-c1c2-7343-db76-dd7f2cd36e24")
    Osi.PlayEffect(character, "44c46f2c-caba-ddbf-c1b5-1af6e245356f")
    Osi.Die(character)
    _P(character .. " has been killed.")
  end
})
