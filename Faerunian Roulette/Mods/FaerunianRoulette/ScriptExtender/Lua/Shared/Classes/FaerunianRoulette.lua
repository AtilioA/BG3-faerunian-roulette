---@class FaerunianRoulette: MetaClass
FaerunianRoulette = _Class:Create("FaerunianRoulette", nil, {
  character = nil,
  handledCharacter = false,
  remainingChambers = Config:getCfg().FEATURES.chamber_size,
  remainingBullets = Config:getCfg().FEATURES.bullets_in_chamber,
  config = Config:getCfg().FEATURES
})

function FaerunianRoulette:SetCharacter(character)
  self.character = character
end

function FaerunianRoulette:PullTrigger()
  FRDebug(0, "Trigger pulled.")
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
  self.remainingBullets = self.config.bullets_in_chamber
  self.remainingChambers = self.config.chamber_size
end

function FaerunianRoulette:ApplyBulletEffects()
  -- TODO: Handle effect logic, e.g., 'kill', 'downed', 'heal', 'damage', statuses...
  if self.config.trigger_effect.kill and Osi.IsInPartyWith(GetHostCharacter(), self.character) == 0 then
    FRWarn(0, "Bullet fired!")
    Osi.PlayEffect(self.character, self.config.trigger_effect.sound_effect.sound)
    Osi.PlayEffect(self.character, "44c46f2c-caba-ddbf-c1b5-1af6e245356f")
    Osi.Die(self.character)
  end

  if true then
    self.remainingBullets = self.remainingBullets - 1
    -- self.remainingChambers = self.remainingChambers - 1

    if self.remainingBullets == 0 then
      self:Reload()
    end
  end
end

function FaerunianRoulette:AfterTriggerPull()
  if self.config.spin_chamber.enabled then
    self:SpinChamber()
  end

  -- REVIEW: Additional post-trigger logic
end

function FaerunianRoulette:SpinChamber()
  self.remainingChambers = self.chamber_size
end

-- REVIEW: we might want to play effects instead, they have a visual and audio component and most of the time the sound is not played if used "as a sound effect"
function FaerunianRoulette:PlaySoundEffect(sound)
  if sound.enabled then
    FRDebug(0, "Playing sound effect:", sound.sound)
    Osi.PlaySound(self.character, sound.sound)
  end
end
