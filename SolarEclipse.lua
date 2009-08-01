--[[

    SolarEclipse
    Copyright (c) 2008, Anton I. (Neav @ Alleria-EU)
    All rights reserved.

--]]

if select(2, UnitClass("player")) ~= "DRUID" then 
    return 
end

local i = 0
local showAs = SolarEclipse.showAs
local name, _, icon, _, _, _, _, _, _ = GetSpellInfo(48517)
local playerName, _ = UnitName("player")
local playerColor = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

local f = CreateFrame(showAs == "bar" and "StatusBar" or "Frame", nil)
local ff = CreateFrame("Frame", nil)
ff:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

local f_icon = f:CreateTexture(nil, "ARTWORK")
local f_barbg = f:CreateTexture(nil, "BACKGROUND")
local f_barbg1 = f:CreateTexture(nil, "ARTWORK")

if (SolarEclipse.bar.showIcon) then
    SolarEclipse.bar.width = SolarEclipse.bar.width -(SolarEclipse.bar.height + 2)
end

if (showAs == "bar") then
    f:SetPoint(SolarEclipse.bar.position[1], SolarEclipse.bar.position[2], SolarEclipse.bar.position[3], SolarEclipse.bar.position[4], SolarEclipse.bar.position[5])
    f:SetStatusBarTexture("Interface\\AddOns\\SolarEclipse\\statusbarTexture")
    if (SolarEclipse.bar.playerColorAsBarColor) then
        f:SetStatusBarColor(playerColor.r, playerColor.g, playerColor.b)
    else
        f:SetStatusBarColor(SolarEclipse.bar.barColor[1], SolarEclipse.bar.barColor[2], SolarEclipse.bar.barColor[3])
    end
    f:SetMinMaxValues(0, 30)
    f:SetScale(SolarEclipse.bar.scale)
    f:SetAlpha(SolarEclipse.bar.alpha)
    
    f_barbg1:SetAllPoints(f)
    f_barbg1:SetTexture("Interface\\Buttons\\WHITE8x8")
    f_barbg1:SetVertexColor(playerColor.r, playerColor.g, playerColor.b, 0.25)
    
    f_barbg:SetTexture("Interface\\Buttons\\WHITE8x8")
    f_barbg:SetPoint("TOPRIGHT", f, 2, 2)
    f_barbg:SetPoint("BOTTOMLEFT", f, -2, -2)
    f_barbg:SetVertexColor(0, 0, 0, 0.7)
    if (showAs == "bar" and SolarEclipse.bar.showIcon) then
        if (SolarEclipse.bar.iconPosition == "right") then
            f_barbg:SetPoint("TOPRIGHT", f_icon, 2, 2)
        elseif (SolarEclipse.bar.iconPosition == "left") then
            f_barbg:SetPoint("BOTTOMLEFT", f_icon, -2, -2)
        end
    end
else
    f:SetPoint(SolarEclipse.icon.position[1], SolarEclipse.icon.position[2], SolarEclipse.icon.position[3], SolarEclipse.icon.position[4], SolarEclipse.icon.position[5])
    f:SetScale(SolarEclipse.icon.scale)
    f:SetAlpha(SolarEclipse.icon.alpha)
end

f:SetParent(UIParent)
f:SetScale((showAs == "bar" and SolarEclipse.bar.scale) or SolarEclipse.icon.scale)
f:SetWidth((showAs == "bar" and SolarEclipse.bar.width) or SolarEclipse.icon.size)
f:SetHeight((showAs == "bar" and SolarEclipse.bar.height) or SolarEclipse.icon.size)
f:Hide()

if (showAs == "icon") then
    f_icon:SetAllPoints(f)
    local f_border = f:CreateTexture(nil, "OVERLAY")
    f_border:SetParent(f)
    f_border:SetTexture("Interface\\AddOns\\SolarEclipse\\borderTexture")
    f_border:SetPoint("TOPRIGHT", f_icon, 4, 4)
    f_border:SetPoint("BOTTOMLEFT", f_icon, -4, -4)
    f_border:SetVertexColor(SolarEclipse.icon.borderColor[1], SolarEclipse.icon.borderColor[2], SolarEclipse.icon.borderColor[3])
end
if (showAs == "bar" and SolarEclipse.bar.showIcon) then
    f_icon:SetPoint((SolarEclipse.bar.iconPosition == "right" and "LEFT") or "RIGHT", f, (SolarEclipse.bar.iconPosition == "right" and "RIGHT") or "LEFT", (SolarEclipse.bar.iconPosition == "right" and 2) or -2, 0)
    f_icon:SetWidth(SolarEclipse.bar.height)
    f_icon:SetHeight(SolarEclipse.bar.height)
    f_icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    if (SolarEclipse.bar.iconPosition == "right") then
        f_barbg:SetPoint("TOPRIGHT", f_icon, 2, 2)
        f:SetPoint(SolarEclipse.bar.position[1], SolarEclipse.bar.position[2], SolarEclipse.bar.position[3], SolarEclipse.bar.position[4] - SolarEclipse.bar.height/2, SolarEclipse.bar.position[5])
    elseif (SolarEclipse.bar.iconPosition == "left") then
        f_barbg:SetPoint("BOTTOMLEFT", f_icon, -2, -2)
        f:SetPoint(SolarEclipse.bar.position[1], SolarEclipse.bar.position[2], SolarEclipse.bar.position[3], SolarEclipse.bar.position[4] + SolarEclipse.bar.height/2, SolarEclipse.bar.position[5])
    end
end
f_icon:SetTexture(icon)
f_icon:SetParent(f)

local f_time = f:CreateFontString(nil, "OVERLAY")
f_time:SetParent(f)
if (showAs == "icon") then
    f_time:SetPoint("CENTER", f, SolarEclipse.icon.timeOffsetX, SolarEclipse.icon.timeOffsetY)
    f_time:SetShadowOffset(0, 0)
    f_time:SetFont(SolarEclipse.icon.font[1], SolarEclipse.icon.font[2], SolarEclipse.icon.font[3])
    f_time:SetVertexColor(SolarEclipse.icon.fontColor[1], SolarEclipse.icon.fontColor[2], SolarEclipse.icon.fontColor[3])
else
    f_time:SetPoint("RIGHT", f, -17, 0)
    f_time:SetJustifyH("RIGHT")
    f_time:SetShadowOffset(1, -1)
    f_time:SetFont(SolarEclipse.bar.fontTime[1], SolarEclipse.bar.fontTime[2], SolarEclipse.bar.fontTime[3])
    f_time:SetVertexColor(SolarEclipse.bar.fontTimeColor[1], SolarEclipse.bar.fontTimeColor[2], SolarEclipse.bar.fontTimeColor[3])
end

if (showAs == "bar") then
    local f_text = f:CreateFontString(nil, "OVERLAY")
    f_text:SetParent(f)
    f_text:SetJustifyH("LEFT")
    f_text:SetFont(SolarEclipse.bar.fontName[1], SolarEclipse.bar.fontName[2], SolarEclipse.bar.fontName[3])
    f_text:SetShadowOffset(1, -1)
    f_text:SetPoint("LEFT", f, "LEFT", 17, 0)
    f_text:SetPoint("RIGHT", f_time, "LEFT", -4, 0)
    f_text:SetVertexColor(SolarEclipse.bar.fontNameColor[1], SolarEclipse.bar.fontNameColor[2], SolarEclipse.bar.fontNameColor[3])
    f_text:SetHeight(10)
    f_text:SetText('eclipse cd')
end

ff:SetScript("OnEvent", function(self, event, timeStamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellID)
    if (eventType =="SPELL_AURA_APPLIED") then 
        if (sourceName == playerName) then
            if (arg9 == 48517) then
                i = 0
                f:Show()
                if (style == "bar") then
                    f:SetValue(30)
                end
            end
        end
    end
end)

local LastUpdate = 0
local UpdateDelay = 0.5

ff:SetScript("OnUpdate", function(self, elapsed)
    LastUpdate = LastUpdate + elapsed
    if (LastUpdate > UpdateDelay) then
        i = i + elapsed
        f_time:SetText(strsub(tostring(30 - i), 1, 3))
        if (showAs == "bar") then
            f:SetValue(30 - i)
        end
        
        if (30 - i) <= 0 then
            f:Hide()
        end
    end
end)