Config = VCHelpers.Config:New({
  folderName = "FaerunianRoulette",
  configFilePath = "faerunian_roulette_config.json",
  defaultConfig = {
    GENERAL = {
      enabled = true, -- Toggle the mod on/off
    },
    FEATURES = {
      trigger_effect = { -- What should happen when the 'trigger' is pulled and the 'chamber' has a 'bullet' in it. Having more than one of these enabled will make them share their chance of being triggered (e.g. 50% chance for each if two are enabled and they have the same chamber size)
        kill = true, -- Kill the character
        downed = false, -- Down the character
        heal = { -- Heal the character
          enabled = false,
          amount = 0 -- Amount of healing
        },
        damage = { -- Damage the character
          enabled = false,
          amount = 0 -- Amount of damage
        },
      },
      chamber_size = { -- Default is a six-chamber 'revolver'
        kill = 6,
        downed = 6,
        heal = 6,
        damage = 6,
      },
      bullets_in_chamber = { -- Default is 1, which is the same as having one 'bullet' in the 'chamber'
        kill = 1,
        downed = 1,
        heal = 1,
        damage = 1,
      },
      spin_chamber = { -- Reset the 'revolver chamber' after a trigger, to guarantee the same effect chance every time. If disabled, the chances will increase with each trigger. https://en.wikipedia.org/wiki/Russian_roulette#Variant:_revolver_only_spun_once_at_the_start
        enabled = true,
        sound = "VFX...",
      },
      pull_trigger_condition = {
        turn_end = true, -- Pull the trigger at the end of the character's turn
        turn_start = false, -- Pull the trigger at the start of the character's turn
        random = {
          enabled = false, -- Pull the trigger at a random time
          min_seconds = 1, -- Minimum number of seconds before the trigger can be pulled
          max_seconds = 60, -- Maximum number of seconds before the trigger can be pulled
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
Config:RegisterReloadConfigCommand("src")
