--[[

    EclipseProc
    Copyright (c) 2008, Anton I. (Neav @ Alleria-EU /CORE\) & Ettan @ Scarshield Legion EU /EclipseTimers\
    All rights reserved.

--]]

SolarEclipse = {
    showAs = "bar",   -- icon or barmode? possible: "icon" or "bar"
    
    icon = {
        size = 40,
        scale = 1.03,
        alpha = 1.0,
        position = {"CENTER", UIParent, "CENTER", 0, -100},
        borderColor = {1, 0, 0}, 
        font = {"Fonts\\ARIALN.ttf", 17, "OUTLINE"},
        fontColor = {1, 1, 1},
        timeOffsetX = 0,
        timeOffsetY = 0,
    },
        
    bar = { 
        width = 348,
        height = 15,
        scale = 1.03,
        alpha = 1.0,
        position = {"BOTTOM", UIParent, "BOTTOM", 0, 160.35},
        showIcon = false,
        iconPosition = "right",    -- on wich side of the bar do you want to show the icon? possible: "left" or "right"
        barColor = {0, 1, 0},
        playerColorAsBarColor = true,
        fontName = {"Fonts\\ARIALN.ttf", 14, nil},
        fontNameColor = {1, 1, 1},
        fontTime = {"Fonts\\ARIALN.ttf", 14, nil},
        fontTimeColor = {1, 1, 1},
    },
}


LunarEclipse = {
    showAs = "bar",   -- icon or barmode? possible: "icon" or "bar"
    
    icon = {
        size = 40,
        scale = 1.03,
        alpha = 1.0,
        position = {"CENTER", UIParent, "CENTER", 0, -100},
        borderColor = {1, 0, 0}, 
        font = {"Fonts\\ARIALN.ttf", 17, "OUTLINE"},
        fontColor = {1, 1, 1},
        timeOffsetX = 0,
        timeOffsetY = 0,
    },
        
    bar = { 
        width = 348,
        height = 15,
        scale = 1.03,
        alpha = 1.0,
        position = {"BOTTOM", UIParent, "BOTTOM", 0, 190.35},
        showIcon = false,
        iconPosition = "right",    -- on wich side of the bar do you want to show the icon? possible: "left" or "right"
        barColor = {0, 1, 0},
        playerColorAsBarColor = true,
        fontName = {"Fonts\\ARIALN.ttf", 14, nil},
        fontNameColor = {1, 1, 1},
        fontTime = {"Fonts\\ARIALN.ttf", 14, nil},
        fontTimeColor = {1, 1, 1},
    },
}
