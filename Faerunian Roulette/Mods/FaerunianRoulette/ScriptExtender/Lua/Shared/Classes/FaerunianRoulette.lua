---@class FaerunianRoulette: MetaClass
FaerunianRoulette = _Class:Create("FaerunianRoulette", nil, {
  character = nil,
  handledCharacter = false,
  remainingChambers = Config:getCfg().FEATURES.chamber_size,
  remainingBullets = Config:getCfg().FEATURES.bullets_in_chambers,
  config = Config:getCfg().FEATURES
})

function FaerunianRoulette:SetCharacter(character)
  self.character = character
end

function FaerunianRoulette:PullTrigger()
  FRDebug(0, "Trigger pulled.")
  FRDebug(2, "Remaining chambers:" .. self.remainingChambers)
  FRDebug(2, "Remaining bullets:" .. self.remainingBullets)
  self:DetermineOutcome()
  self.remainingChambers = self.remainingChambers - 1
  if self.remainingChambers == 0 and not self.config.spin_chamber.enabled then
    -- If the chamber is not spun after every trigger pull and all chambers have been used, reset the remaining chambers to simulate starting over.
    self:SpinChamber()
  end
  self:AfterTriggerPull()
end

function FaerunianRoulette:DetermineOutcome()
  local shouldFireBullet = self:ShouldFireBullet()
  if shouldFireBullet then
    self:ApplyBulletEffects()
  else
    FRDebug(1, "The chamber was empty.")
  end
end

function FaerunianRoulette:ShouldFireBullet()
  local chance = Ext.Math.Random(1, self.remainingChambers)
  return chance <= self.remainingBullets
end

function FaerunianRoulette:Reload()
  self.remainingBullets = self.config.bullets_in_chambers
  self.remainingChambers = self.config.chamber_size
end

function FaerunianRoulette:ApplyBulletEffects()
  local enabledEffects = {}

  -- I was going to implement a strategy pattern here, but the deadline is too close, sorry!
  if self.config.trigger_effect.ignore.bosses and Osi.IsBoss(self.character) == 1 then
    FRDebug(1, "Ignoring bosses.")
  else
    if self.config.trigger_effect.kill then
      table.insert(enabledEffects, Effects.KillEffect.apply)
    end
    if self.config.trigger_effect.damage.enabled then
      table.insert(enabledEffects, Effects.DamageEffect.apply)
    end
    if self.config.trigger_effect.heal.enabled then
      table.insert(enabledEffects, Effects.HealEffect.apply)
    end
    if self.config.trigger_effect.apply_status.enabled then
      table.insert(enabledEffects, Effects.StatusEffect.apply)
    end
  end

  -- If there are enabled effects, randomly select and apply one
  if #enabledEffects > 0 then
    local randomEffect = enabledEffects[Ext.Math.Random(1, #enabledEffects)]
    randomEffect(self.character)
  end

  -- if true then
  self.remainingBullets = self.remainingBullets - 1
  -- self.remainingChambers = self.remainingChambers - 1

  if self.remainingBullets <= 0 then
    self:Reload()
    -- end
  end
end

function FaerunianRoulette:AfterTriggerPull()
  if self.config.spin_chamber.enabled then
    self:SpinChamber()
  end

  -- REVIEW: Additional post-trigger logic?
end

function FaerunianRoulette:SpinChamber()
  FRDebug(2, "Spinning the chamber.")
  self.remainingChambers = self.config.chamber_size
  if self.config.spin_chamber.sound_effect.enabled then
    self:PlaySoundEffect(self.config.spin_chamber.sound_effect)
  end
end

-- REVIEW: we might want to play effects instead, they have a visual and audio component and most of the time the sound is not played if used "as a sound effect"
function FaerunianRoulette:PlaySoundEffect(sound)
  if sound.enabled then
    FRDebug(0, "Playing sound effect:", sound.sound)
    Osi.PlayEffect(self.character, sound.sound)
    Osi.PlaySound(self.character, sound.sound)
    Osi.PlaySoundResource(self.character, sound.sound)
  end
end
