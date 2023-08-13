local turtle = require("turtle")
Angle = 0
local function face(angle) -- Face towards an angle relative to the turtles's starting position.
    angle = angle % 4
    local diff = angle - Angle
    if diff < 0 then diff = diff + 4 end
    if diff == 0 then
    elseif diff == 1 then turtle.turnRight()
    elseif diff == 2 then
        turtle.turnRight()
        turtle.turnRight()
    elseif diff == 3 then turtle.turnLeft()
    else
        return {false, "Invalid diff" + diff}
    end
    Angle = angle
    return true
end

return {face = face, forward = forward, back = back, up = up, down = down}