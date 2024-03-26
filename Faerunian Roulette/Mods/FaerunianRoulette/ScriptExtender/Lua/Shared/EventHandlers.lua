EHandlers = {}


function EHandlers.OnTurnEnded(object)
  FRDebug(2, "TurnEnded event fired: " .. object)
  RouletteGame:SetCharacter(object)

  -- Handle the 'pull_trigger_condition.turn_end' feature
  if Config:getCfg().FEATURES.pull_trigger_condition.turn_end and VCHelpers.Object:IsCharacter(object) then
    RouletteGame:PullTrigger()
  end

  -- Cleanup the 'pull_trigger_condition.random' feature if it is enabled to make sure the timer does not fire outside of the current turn
  if Config:getCfg().FEATURES.pull_trigger_condition.random.enabled then
    Osi.TimerCancel("FR_RandomTriggerTimer")
  end
end

function EHandlers.OnTurnStarted(object)
  FRDebug(2, "TurnStarted event fired: " .. object)
  RouletteGame:SetCharacter(object)

  -- Handle the 'pull_trigger_condition.turn_start' feature
  if Config:getCfg().FEATURES.pull_trigger_condition.turn_start and VCHelpers.Object:IsCharacter(object) then
    RouletteGame:PullTrigger()
  end

  -- Handle the 'pull_trigger_condition.random' feature
  if Config:getCfg().FEATURES.pull_trigger_condition.random.enabled then
    local minSeconds = Config:getCfg().FEATURES.pull_trigger_condition.random.min_seconds
    local maxSeconds = Config:getCfg().FEATURES.pull_trigger_condition.random.max_seconds
    local randomMS = Ext.Math.Random(minSeconds, maxSeconds) * 1000

    Osi.TimerLaunch("FR_RandomTriggerTimer", randomMS)
  end
end

function EHandlers.OnTimerFinished(timer)
  -- Handle the 'pull_trigger_condition.random' feature (timer has finished)
  if timer == "FR_RandomTriggerTimer" and Config:getCfg().FEATURES.pull_trigger_condition.random.enabled then
    FRDebug(2, "TimerFinished event fired: " .. timer)
    RouletteGame:PullTrigger()
  end
end

return EHandlers
