ZZ = 1
local function getMouse()
    return Hyperspace.Mouse.position.x, Hyperspace.Mouse.position.y
end

local function groove_before(ship)
    local mx, my = getMouse()
    local rotate = mx+my
    Graphics.CSurface.GL_PushMatrix()
    Graphics.CSurface.GL_Translate(0, 0, ZZ)
    Graphics.CSurface.GL_Rotate(rotate, mx, my)
end

local function groove_after()
    Graphics.CSurface.GL_PopMatrix()
end

script.on_render_event(Defines.RenderEvents.SHIP_MANAGER, groove_before, groove_after)
script.on_render_event(Defines.RenderEvents.SHIP_HULL, groove_before, groove_after)
script.on_render_event(Defines.RenderEvents.SHIP_ENGINES, groove_before, groove_after)
script.on_render_event(Defines.RenderEvents.SHIP_FLOOR, groove_before, groove_after)
script.on_render_event(Defines.RenderEvents.SHIP_BREACHES, groove_before, groove_after)
script.on_render_event(Defines.RenderEvents.SHIP_SPARKS, groove_before, groove_after)
