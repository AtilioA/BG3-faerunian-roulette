Effects.EntangleEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
      _P(character.name .. " has been Entangle'd.")
  end
})
