Effects.BlessEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
      _P(character.name .. " has been Bless'd.")
  end
})
