Effects.FreezeEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
      _P(character.name .. " has been Freeze'd.")
  end
})
