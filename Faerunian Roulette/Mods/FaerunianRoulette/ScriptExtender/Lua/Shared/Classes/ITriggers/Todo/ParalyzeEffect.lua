Effects.ParalyzeEffect = Effects.ImplementEffect(ITriggerEffect, {
  apply = function(character)
      _P(character.name .. " has been Paralyze'd.")
  end
})
