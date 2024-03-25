Effects.DiseaseEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
      _P(character.name .. " has been Disease'd.")
  end
})
