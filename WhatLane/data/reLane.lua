local function RemoveLane()
    local map = Hyperspace.App.world.starMap
    for loc in vter(map.locations) do
        loc.connectedLocations:clear()
    end
end


local function SingleLane()
    NL()
    local map = Hyperspace.App.world.starMap
    local used = {}
    local max = 0
    local function recursive(loc)
        max = max + 1
        if max > 50 then --failsafe
            return
        end
        used[tostring(loc)] = true
        local pos = loc.loc
        local dist = 9999
        local saved = false
        for loc2 in vter(map.locations) do
            if not used[tostring(loc2)] and loc2 ~= loc then
                local pos2 = loc2.loc
                if distance(pos.x, pos.y, pos2.x, pos2.y) < dist then
                    dist = distance(pos.x, pos.y, pos2.x, pos2.y)
                    saved = loc2
                end
            end
        end
        if saved then
            loc.connectedLocations:push_back(saved)
            saved.connectedLocations:push_back(loc)
            recursive(saved)
        end
    end

    recursive(map.locations[0])
end
