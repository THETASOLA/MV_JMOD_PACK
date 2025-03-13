mods = mods or {}
local plainTint = Graphics.GL_Color(1,1,1,1)

local function calculateHPPercent(ship)
    return ship.hullIntegrity.first / ship.hullIntegrity.second
end

local function getMoveFromHp(hp)
    local value = math.floor((2 - hp*2)*10)
    return math.random(-value, value)/10
end

local function groove_before(ship)
    local hpP = calculateHPPercent(ship)
    Graphics.CSurface.GL_PushMatrix()
    Graphics.CSurface.GL_Translate(getMoveFromHp(hpP), getMoveFromHp(hpP), 0)
end

local function groove_before_col(shipManager)
    local ship = shipManager.ship
    local hpP = calculateHPPercent(ship)
    Graphics.CSurface.GL_PushMatrix()
    Graphics.CSurface.GL_Translate(getMoveFromHp(hpP), getMoveFromHp(hpP), 0)

    if hpP == 0 then return end

    local colour = Graphics.GL_Color(1, hpP, hpP,1)
    Graphics.CSurface.GL_SetColorTint(colour)
end

local function groove_after()
    Graphics.CSurface.GL_SetColorTint(plainTint)
    Graphics.CSurface.GL_PopMatrix()
end

script.on_render_event(Defines.RenderEvents.SHIP_MANAGER, groove_before_col, groove_after)
script.on_render_event(Defines.RenderEvents.SHIP_HULL, groove_before, groove_after)
script.on_render_event(Defines.RenderEvents.SHIP_ENGINES, groove_before, groove_after)
script.on_render_event(Defines.RenderEvents.SHIP_FLOOR, groove_before, groove_after)
script.on_render_event(Defines.RenderEvents.SHIP_BREACHES, groove_before, groove_after)
script.on_render_event(Defines.RenderEvents.SHIP_SPARKS, groove_before, groove_after)
