mods.ultra_precis_cd = {}

local cd = mods.ultra_precis_cd

cd.funnyCD = {
    "Barely started",
    "Getting (a bit) warmer",
    "at least 1",
    "maybe 2",
    "define 'charging'",
    "better than it was before",
    "we're getting somewhere",
    "I can feel it",
    "almost there",
    "just a bit more",
    "I can see the light",
    "uuh"
}

script.on_internal_event(Defines.InternalEvents.WEAPON_RENDERBOX, function(weapon, cooldown, maxCooldown, firstLine, secondLine)

    local firstLine_modified = ""
    if cooldown == 0 then
        firstLine_modified = "forgor to activate it"
    elseif cooldown == maxCooldown then
        firstLine_modified = "READY!!!"
    else
        firstLine_modified = cd.funnyCD[math.floor(cooldown / maxCooldown * #cd.funnyCD) + 1]
    end

    return Defines.Chain.Continue, firstLine_modified, secondLine
end)