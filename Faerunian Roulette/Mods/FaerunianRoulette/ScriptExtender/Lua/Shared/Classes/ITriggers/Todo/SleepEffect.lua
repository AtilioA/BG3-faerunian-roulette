Effects.SleepEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
      _P(character.name .. " has been Sleep'd.")
  end
})
