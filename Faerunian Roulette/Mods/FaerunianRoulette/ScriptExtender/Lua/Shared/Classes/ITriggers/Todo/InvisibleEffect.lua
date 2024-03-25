Effects.InvisibleEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
      _P(character.name .. " has been Invisible'd.")
  end
})
