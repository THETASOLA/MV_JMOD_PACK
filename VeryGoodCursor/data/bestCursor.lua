mods.cursor = {}

local cd = mods.cursor
local mouse = Hyperspace.Mouse
local delay = 0.1
local cursor = 1

cd.prim = {
    Hyperspace.Resources:GetImageId("cursor/cur_1.png"),
    Hyperspace.Resources:GetImageId("cursor/cur_2.png"),
    Hyperspace.Resources:GetImageId("cursor/cur_3.png")
}

script.on_internal_event(Defines.InternalEvents.ON_TICK, function()
    local dt = Hyperspace.FPS.SpeedFactor/16
    if mouse.animateDoor > 0 or mouse.bSellingStuff then
        mouse.animateDoor = 0
        mouse.bSellingStuff = false
        mouse.valid = true
    end
    if delay < 0 then
        delay = 0.1
        mouse.validPointer = cd.prim[cursor]
        mouse.invalidPointer = cd.prim[1]
        cursor = cursor + 1
        if cursor > 3 then
            cursor = 1
        end
    end
    delay = delay - dt
end)