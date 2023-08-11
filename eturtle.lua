-- turtle = require("turtle")
local eturtle = {}
local function move(func, distance)
    distance = distance or 1
    for i = 1, distance do
        local result = { func() }
        if not result[1] then
            if not i == 1 then
                result[3] = i - 1
                return result
            end
        end
        return true
    end
end

function eturtle.craft(limit)
    if turtle.craft == nil then return { false, "Turtle cannot craft" } end
    return turtle.craft(limit)
end

function eturtle.forward(distance)
    return move(turtle.forward, distance)
end

function eturtle.back(distance)
    return move(turtle.back, distance)
end

function eturtle.up(distance)
    return move(turtle.up, distance)
end

function eturtle.down(distance)
    return move(turtle.down, distance)
end

function eturtle.turnLeft(distance)
    distance = distance % 4
    return move(turtle.turnLeft, distance)
end

function eturtle.turnRight(distance)
    distance = distance % 4
    return move(turtle.turnRight, distance)
end

eturtle.getFuelLevel = turtle.getFuelLevel

function eturtle.refuel()
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

function eturtle.compareTo(slot, slot2)
    local previous = turtle.getSelectedSlot()
    if not slot2 == nil then turtle.select(slot2) end
    local result = turtle.compareTo(slot)
    turtle.select(previous)
    return result
end

function eturtle.transferTo(slot, count, slot2)
    local previous = turtle.getSelectedSlot()
    turtle.select(slot2 or previous)
    local result = turtle.transferTo(slot, count)
    turtle.select(previous)
    return result
end

eturtle.getSelectedSlot = turtle.getSelectedSlot

eturtle.select = turtle.select

eturtle.getItemCount = turtle.getItemCount

eturtle.getItemSpace = turtle.getItemSpace

eturtle.detect = turtle.detect

eturtle.detectUp = turtle.detectUp

eturtle.detectDown = turtle.detectDown


function eturtle.compare(slot)
    local previous = turtle.getSelectedSlot()
    turtle.select(slot or previous)
    local result = turtle.compare()
    turtle.select(previous)
    return result
end

function eturtle.compareUp(slot)
    local previous = turtle.getSelectedSlot()
    turtle.select(slot or previous)
    local result = turtle.compareUp()
    turtle.select(previous)
    return result
end

function eturtle.compareDown(slot)
    local previous = turtle.getSelectedSlot()
    turtle.select(slot or previous)
    local result = turtle.compareDown()
    turtle.select(previous)
    return result
end

eturtle.attack = turtle.attack

eturtle.attackUp = turtle.attackUp

eturtle.attackDown = turtle.attackDown

eturtle.suckUp = turtle.suck

eturtle.suckDown = turtle.suckDown

eturtle.turtle.getFuelLimit = turtle.getFuelLimit

function eturtle.equipLeft(slot)
    local previous = turtle.getSelectedSlot()
    turtle.select(slot or previous)
    turtle.equipLeft()
    turtle.select(previous)
end

function eturtle.equipRight(slot)
    local previous = turtle.getSelectedSlot()
    turtle.select(slot or previous)
    turtle.equipRight()
    turtle.select(previous)
end

eturtle.inspect = turtle.inspect

eturtle.inspectUp = turtle.inspectUp

eturtle.inspectDown = turtle.inspectDown

eturtle.getItemDetail = turtle.getItemDetail

return eturtle