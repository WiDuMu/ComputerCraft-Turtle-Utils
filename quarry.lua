local turtle = require("turtle")
local utils = require("utils")

local x,y,z = 0,0,0 -- Coords of the turtle

local boundX, boundZ = 0,0 -- This program 

function refuelInPlace ()
    local result = false
    local slot = turtle.getSelectedSlot()
    for i = 1, 16 do
        turtle.select(i)
        if turtle.refuel() then
            result = true
        end
    end
    turtle.select(slot)
    return result
end

function refuelByReturning ()
    while x > 0 do
        turtle.back()
    end
    turtle.turnLeft()
    while z > 0 do
        turtle.forward()
    end
    while y > 0 do 
        turtle.up()
    end
    turtle.turnRight()
end

function refuel ()
    refuelInPlace()
    if turtle.getFuelLevel < 100 then
        refuelByReturning()
    end
end

while true do
   if turtle.getFuelLevel() < 100 then
      refuel()
   else

end