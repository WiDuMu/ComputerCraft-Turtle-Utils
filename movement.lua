Angle = 0
local function face(angle) -- Face towards an angle relative to the turtles's starting position.
    Angle = Angle % 4
    angle = angle % 4
    --print("Rotating to position ", angle, " Current angle: ", Angle)
    local diff = angle - Angle
    --print("Diff: ", diff)
    if diff < 0 then diff = diff + 4 end
    if diff == 0 then
        --print("Angles are the same, continue")
    elseif diff == 1 then
        --print("turning right")
        turtle.turnRight()
    elseif diff == 2 then
        --print("Turning around")
        turtle.turnRight()
        turtle.turnRight()
    elseif diff == 3 then
        --print("Turning left")
        turtle.turnLeft()
    else
        print("Error, invalid diff: ", diff)
        return false
    end
    Angle = angle
    return true
end

-- Turtle movement functions enhanced by multiple movement
local function forward(distance)
    for i = 1, distance do
        if not turtle.forward() then
            if i == 1 then
                return {false, "Unable to move"}
            end
            return {false, "Partial move", i}
        end
    end
    return true
end
local function back(distance)
    for i = 1, distance do
        if not turtle.back() then
            if i == 1 then
                return {false, "Unable to move"}
            end
            return {false, "Partial move", i}
        end
    end
    return true
end
local function up(distance)
    for i = 1, distance do
        if not turtle.up() then
            if i == 1 then
                return {false, "Unable to move"}
            end
            return {false, "Partial move", i}
        end
    end
    return true
end
local function down(distance)
    for i = 1, distance do
        if not turtle.down() then
            if i == 1 then
                return {false, "Unable to move"}
            end
            return {false, "Partial move", i}
        end
    end
    return true
end

return {face = face, forward = forward, back = back, up = up, down = down}