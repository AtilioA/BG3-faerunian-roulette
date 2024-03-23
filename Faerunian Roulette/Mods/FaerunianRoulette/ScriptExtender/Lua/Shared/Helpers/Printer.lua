FRPrinter = VolitionCabinetPrinter:New { Prefix = "Faerûnian Roulette", ApplyColor = true, DebugLevel = Config:GetCurrentDebugLevel() }

function FRPrint(debugLevel, ...)
  FRPrinter:SetFontColor(0, 255, 255)
  FRPrinter:Print(debugLevel, ...)
end

function FRTest(debugLevel, ...)
  FRPrinter:SetFontColor(100, 200, 150)
  FRPrinter:PrintTest(debugLevel, ...)
end

function FRDebug(debugLevel, ...)
  FRPrinter:SetFontColor(200, 200, 0)
  FRPrinter:PrintDebug(debugLevel, ...)
end

function FRWarn(debugLevel, ...)
  FRPrinter:SetFontColor(255, 100, 50)
  FRPrinter:PrintWarning(debugLevel, ...)
end

function FRDump(debugLevel, ...)
  FRPrinter:SetFontColor(190, 150, 225)
  FRPrinter:Dump(debugLevel, ...)
end

function FRDumpArray(debugLevel, ...)
  FRPrinter:DumpArray(debugLevel, ...)
end
