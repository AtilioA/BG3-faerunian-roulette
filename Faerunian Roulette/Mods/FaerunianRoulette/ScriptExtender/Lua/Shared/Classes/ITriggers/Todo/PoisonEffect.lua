Effects.PoisonEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
      _P(character.name .. " has been Poison'd.")
  end
})
