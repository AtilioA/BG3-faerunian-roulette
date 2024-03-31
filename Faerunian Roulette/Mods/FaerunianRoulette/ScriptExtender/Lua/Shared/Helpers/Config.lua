Config = VCHelpers.Config:New({
  folderName = "FaerunianRoulette",
  configFilePath = "faerunian_roulette_config.json",
  defaultConfig = {
    GENERAL = {
      enabled = true, -- Toggle the mod on/off
    },
    FEATURES = {
      cylinder_size = 6,                                 -- Default is a six-chamber 'revolver'
      bullets_in_chambers = 1,                           -- Default is 1, which is the same as having one 'bullet' in the 'chamber'
      trigger_effect = {                                 -- What should happen when the 'trigger' is pulled and the 'chamber' has a 'bullet' in it. Having more than one of these enabled will make one be randomly picked, essentially sharing the probability of each effect happening.
        sound_effect = {                                 -- Play a sound effect when the effect is triggered
          enabled = true,                                -- Play a sound effect
          sound = "dee8060b-c1c2-7343-db76-dd7f2cd36e24" -- Sound effect to play
        },
        kill = true,                                     -- Kill the character
        heal = {                                         -- Heal the character
          enabled = false,
          -- max_percentage = 100                           -- Maximum percentage of health to heal
        },
        damage = {                   -- Damage the character, random amount
          enabled = false,
          max_percentage = 100,      -- Maximum percentage of health to damage
        },
        apply_status = {             -- Apply a random status to the character. This includes over a hundred statuses, so expect chaos! Save often.
          enabled = false,
          max_duration = 3,          -- Max duration of the status in turns. May stack statuses.
          ignore_resistances = false -- Ignore resistances when applying the status
        },
        ignore = {
          bosses = true, -- Ignore bosses
        },
      },
      pull_trigger_condition = { -- Conditions for pulling the trigger; they are independent of each other and can be combined
        turn_end = true,         -- Pull the trigger at the end of the character's turn
        turn_start = false,      -- Pull the trigger at the start of the character's turn
        random_time = {
          enabled = false,       -- Pull the trigger at a random time during the character's turn
          min_seconds = 1,       -- Minimum number of seconds before the trigger can be pulled
          max_seconds = 60,      -- Maximum number of seconds before the trigger can be pulled
        }
      },
      spin_chamber = {   -- Reset the 'revolver chamber' after 'pulling the trigger', to guarantee the same effect chance every time. If disabled, the chances will increase with each 'trigger pull'. https://en.wikipedia.org/wiki/Russian_roulette#Variant:_revolver_only_spun_once_at_the_start
        enabled = true,
        sound_effect = { -- Whether to play a sound effect when spinning the chamber
          enabled = false,
          sound = "005ce565-5ef6-488d-b171-37153f4605cf"
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
