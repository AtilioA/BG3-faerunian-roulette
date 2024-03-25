Effects.SilenceEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
      _P(character.name .. " has been Silence'd.")
  end
})
