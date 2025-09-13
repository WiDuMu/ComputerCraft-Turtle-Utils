local turtle = require("turtle")
local eturtleUtils = {}
Angle = 0
local function rotateTo(angle)
    angle = angle % 4
    print("Rotating to position ", angle, " Current angle: ", Angle)
    local diff = angle - Angle
    print("Diff: ", diff)
    if diff < 0 then diff = diff + 4 end
    if diff == 0 then
        print("Angles are the same, continue")
    elseif diff == 1 then
        print("turning right")
        turtle.turnRight()
    elseif diff == 2 then
        print("Turning around")
        turtle.turnRight()
        turtle.turnRight()
    elseif diff == 3 then
        print("Turning left")
        turtle.turnLeft()
    else
        print("Error, invalid diff: ", diff)
        return false
    end
    Angle = angle
    return true
end
local function freeInventorySlots()
    for i=1,16 do
    end
end
-- Refuels from all inventory slots, draining the inventory
local function refuelFromInventory()
    if turtle.getFuelLimit() == "Unlimited" then
        return
    end
    for i=1,16 do
        turtle.select(i)
        turtle.refuel()
    end
end
-- Selects the first slot that holds the specified block
function eturtleUtils.selectBlock(block)
    for i=1,16 do
        local blocks = turtle.getItemDetail(i)
        if not blocks == nil then
            if blocks.name == block then
                turtle.select(i)
                return true
            end
        end
    end
    return false
end

function manhattanDistance(x1,y1,z1,x2,y2,z2)
    xDiff = math.abs(x1 - x2) 
    yDiff = math.abs(y1 - y2)
    zDiff = math.abs(z1 - z2)
    return xDiff + yDiff + zDiff
end

function manhattanDistanceFromOrigin(x,y,z)
    return manhattanDistance(0,0,0,x,y,z)
end

local args = { ... }
