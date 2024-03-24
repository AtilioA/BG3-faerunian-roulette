Config = VCHelpers.Config:New({
  folderName = "FaerunianRoulette",
  configFilePath = "faerunian_roulette_config.json",
  defaultConfig = {
    GENERAL = {
      enabled = true, -- Toggle the mod on/off
    },
    FEATURES = {
      trigger_effect = {  -- What should happen when the 'trigger' is pulled and the 'chamber' has a 'bullet' in it. Having more than one of these enabled will make them share their chance of being triggered (e.g. 50% chance for each if two are enabled and they have the same chamber size)
        sound_effect = {
          enabled = true, -- Play a sound effect
          -- sound = "Spell_Cast_Damage_Force_EldritchBlast_L1to3",    -- Sound effect to play
          sound = "dee8060b-c1c2-7343-db76-dd7f2cd36e24"
        },
        kill = true,           -- Kill the character
        downed = false,        -- Down the character
        heal = {               -- Heal the character
          enabled = false,
          amount = 0           -- Amount of healing
        },
        damage = {             -- Damage the character
          enabled = false,
          amount = 0           -- Amount of damage
        },
        status = {             -- Apply a status to the character
          -- Osi.ApplyStatus(object, status, duration, force, source) end
          prone = false,       -- Apply the 'Prone' status
          stunned = false,     -- Apply the 'Stunned' status
          frozen = false,      -- Apply the 'Frozen' status
          burning = false,     -- Apply the 'Burning' status
          poisoned = false,    -- Apply the 'Poisoned' status
          blessed = false,     -- Apply the 'Blessed' status
          charmed = false,     -- Apply the 'Charmed' status
          frightened = false,  -- Apply the 'Frightened' status
          paralyzed = false,   -- Apply the 'Paralyzed' status
          petrified = false,   -- Apply the 'Petrified' status
          silenced = false,    -- Apply the 'Silenced' status
          sleep = false,       -- Apply the 'Sleep' status
          blinded = false,     -- Apply the 'Blinded' status
          cursed = false,      -- Apply the 'Cursed' status
          diseased = false,    -- Apply the 'Diseased' status
          invisible = false,   -- Apply the 'Invisible' status
          polymorphed = false, -- Apply the 'Polymorphed' status
          webbed = false,      -- Apply the 'Webbed' status
          entangled = false,   -- Apply the 'Entangled' status
          -- ...
        },
        ignore = {
          bosses = true, -- Ignore bosses
        },
      },
      chamber_size = 6,       -- Default is a six-chamber 'revolver'
      bullets_in_chambers = 1, -- Default is 1, which is the same as having one 'bullet' in the 'chamber'
      spin_chamber = {        -- Reset the 'revolver chamber' after a trigger, to guarantee the same effect chance every time. If disabled, the chances will increase with each trigger. https://en.wikipedia.org/wiki/Russian_roulette#Variant:_revolver_only_spun_once_at_the_start
        enabled = true,
        sound_effect = {
          enabled = true,
          sound = "VFX_TrialOfJustice_LightningOrb",
        }
      },
      pull_trigger_condition = { -- Conditions for pulling the trigger; they are independent of each other and can be combined
        turn_end = true,         -- Pull the trigger at the end of the character's turn
        turn_start = false,      -- Pull the trigger at the start of the character's turn
        random = {
          enabled = false,       -- Pull the trigger at a random time
          min_seconds = 1,       -- Minimum number of seconds before the trigger can be pulled
          max_seconds = 60,      -- Maximum number of seconds before the trigger can be pulled
        }
      }
    },
    DEBUG = {
      level = 0 -- 0 = no debug, 1 = minimal, 2 = verbose debug logs
    }
  },
  onConfigReloaded = {}
})

Config:UpdateCurrentConfig()

Config:AddConfigReloadedCallback(function(configInstance)
  FRPrinter.DebugLevel = configInstance:GetCurrentDebugLevel()
  FRPrint(0, "Config reloaded: " .. Ext.Json.Stringify(configInstance:getCfg(), { Beautify = true }))
end)
Config:RegisterReloadConfigCommand("fr")
