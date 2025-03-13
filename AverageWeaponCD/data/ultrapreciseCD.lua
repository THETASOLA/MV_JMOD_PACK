mods.ultra_precis_cd = {}

local cd = mods.ultra_precis_cd

cd.funnyCD2 = {
    "",
    "Getting",
    "",
    "",
    "",
    "Better than",
    "We're",
    "I can",
    "",
    "Just",
    "I can",
    ""
}

cd.funnyCD = {
    "Barely started",
    "(a bit) warmer",
    "At least 1",
    "Maybe 2",
    "Define 'charging'",
    "it was before",
    "getting somewhere",
    "feel it",
    "Almost there",
    "a bit more",
    "see the light!",
    "uuh"
}

script.on_internal_event(Defines.InternalEvents.WEAPON_RENDERBOX, function(weapon, cooldown, maxCooldown, firstLine, secondLine)

    local firstLine_modified = ""
    local secondline_modified = ""
    if cooldown == 0 then
        secondline_modified = "forgor to"
        firstLine_modified = "activate it"
    elseif cooldown == maxCooldown then
        secondline_modified = "OH BOY:"
        firstLine_modified = "READY!!!"
    else
        secondline_modified = cd.funnyCD2[math.floor(cooldown / maxCooldown * #cd.funnyCD2) + 1]
        firstLine_modified = cd.funnyCD[math.floor(cooldown / maxCooldown * #cd.funnyCD) + 1]
    end

    return Defines.Chain.Continue, firstLine_modified, secondline_modified
end)