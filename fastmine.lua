function rotate(angle)
    local rotations = math.tointeger(angle / 90)
    if rotations > 4 then
        rotations = rotations % 4
    end
    if rotations > 2 then
        for i=1,rotations do
            turtle.turnRight()
        end
    else
        for i=1,rotations do
            turtle.turnLeft()
        end
    end
end
function move(distance)
    for i = 1,distance do
        turtle.forward()
    end
end
function back(distance)
    for i = 1,distance do
        turtle.back()
    end
end
function up(distance)
    for i = 1,distance do
        turtle.up()
    end
end
function down(distance)
    for i = 1,distance do
        turtle.down()
    end
end
function digLayer()
    turtle.dig()
    
end