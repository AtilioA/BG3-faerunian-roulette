Effects.BurnEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
      _P(character.name .. " has been Burn'd.")
  end
})
