Effects.FrightenEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
      _P(character.name .. " has been Frighten'd.")
  end
})