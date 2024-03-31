EHandlers = {}


function EHandlers.OnTurnEnded(object)
  if VCHelpers.Object:IsCharacter(object) then
    FRDebug(2, "TurnEnded event fired: " .. object)
    RouletteGame:SetCharacter(object)

    -- Handle the 'pull_trigger_condition.turn_end' feature
    if Config:getCfg().FEATURES.pull_trigger_condition.turn_end and VCHelpers.Object:IsCharacter(object) then
      RouletteGame:PullTrigger()
    end

    -- Cleanup the 'pull_trigger_condition.random_time' feature if it is enabled to make sure the timer does not fire outside of the current turn
    if Config:getCfg().FEATURES.pull_trigger_condition.random_time.enabled then
      if object == RouletteGame.character then
        FRWarn(2, "Canceled random trigger timer.")
        Osi.TimerCancel("FR_RandomTriggerTimer")
      end
    end
  end
end

function EHandlers.OnTurnStarted(object)
  FRDebug(2, "TurnStarted event fired: " .. object)
  RouletteGame:SetCharacter(object)

  -- Handle the 'pull_trigger_condition.turn_start' feature
  if Config:getCfg().FEATURES.pull_trigger_condition.turn_start and VCHelpers.Object:IsCharacter(object) then
    RouletteGame:PullTrigger()
  end

  -- Handle the 'pull_trigger_condition.random_time' feature
  if Config:getCfg().FEATURES.pull_trigger_condition.random_time.enabled then
    local minSeconds = Config:getCfg().FEATURES.pull_trigger_condition.random_time.min_seconds
    local maxSeconds = Config:getCfg().FEATURES.pull_trigger_condition.random_time.max_seconds
    local randomMS = Ext.Math.Random(minSeconds, maxSeconds) * 1000
    FRWarn(2, "Random trigger timer set to " .. randomMS .. "ms.")

    Osi.TimerLaunch("FR_RandomTriggerTimer", randomMS)
  end
end

function EHandlers.OnTimerFinished(timer)
  -- Handle the 'pull_trigger_condition.random_time' feature (timer has finished)
  if timer == "FR_RandomTriggerTimer" and Config:getCfg().FEATURES.pull_trigger_condition.random_time.enabled then
    FRDebug(2, "TimerFinished event fired: " .. timer)
    RouletteGame:PullTrigger()
  end
end

return EHandlers
