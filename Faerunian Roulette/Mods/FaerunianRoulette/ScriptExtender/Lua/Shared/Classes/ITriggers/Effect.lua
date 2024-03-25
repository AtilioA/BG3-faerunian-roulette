Effects = {}

-- Interface for trigger effects
ITriggerEffect = {
  apply = function(self, character) end
}

--- Implement an effect by extending the base effect
function Effects.ImplementEffect(base, implementation)
  setmetatable(implementation, { __index = base })
  return implementation
end

return Effects
