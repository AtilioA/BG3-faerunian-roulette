Effects.PetrifyEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
      _P(character.name .. " has been Petrify'd.")
  end
})
