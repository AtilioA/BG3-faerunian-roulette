EHandlers = {}


function EHandlers.OnTurnEnded(object)
  if Config:getCfg().FEATURES.pull_trigger_condition.turn_end and VCHelpers.Object:IsCharacter(object) then
    FRDebug(2, "TurnEnded event fired: " .. object)
    RouletteGame:SetCharacter(object)
    RouletteGame:PullTrigger()
  end
end

function EHandlers.OnTurnStarted(object)
  if Config:getCfg().FEATURES.pull_trigger_condition.turn_start and VCHelpers.Object:IsCharacter(object) then
    FRDebug(2, "TurnStarted event fired: " .. object)
    RouletteGame:SetCharacter(object)
    RouletteGame:PullTrigger()
  end
end

return EHandlers
