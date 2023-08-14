local args = { ... }
-- local turtle = require("turtle")
local firstSlot = turtle.getItemDetail(1)
if firstSlot == nil then
    print("Error: you need blocks in the first slot")
    return
end
local blockType = firstSlot.name

local function buildingBlocks()
    local count = 0
    for i = 1, 16 do
        local slotBlocks = turtle.getItemDetail(i)
        if slotBlocks == nil then
        elseif slotBlocks.name == blockType then
            count = count + slotBlocks.count
        end
    end
    print("Blocks available: ", count)
    return count
end

local function switchSlots()
    for i = 1, 16 do
        local slotBlocks = turtle.getItemDetail(i)
        print(slotBlocks)
        if slotBlocks ~= nil then
            if slotBlocks.name == blockType then
                turtle.select(i)
                return true
            end
        end
    end
    return false
end

local function place()
    local result = { turtle.place() }
    if not result[1] then
        if result[2] == "No items to place" then
            if switchSlots() then
                return place()
            else
                return result
            end
        elseif result[2] == "Cannot place block here" then
            -- Currently, do nothing
        end
    end
end

local function bridge(args)
    local availableBlocks = buildingBlocks()
    local length = tonumber(args[1])
    local width = tonumber(args[2])
    if width == nil then width = 3 end
    if length == nil then length = (availableBlocks / width) - 1 end
    local requiredBlocks = length * width
    if requiredBlocks > availableBlocks then
        -- Check with the user
    end
    -- TODO check fuel
    local result
    result = { turtle.forward() }
    if not result[1] then return result end
    for l = 1, length do
        turtle.turnLeft()
        for w = 1, width - 1 do
            turtle.back()
        result = place()
        if not result[1] then return result end
        end
        turtle.turnLeft()
        result = { turtle.back() }
        if not result[1] then return result end
        result = place()
        if not result[1] then return result end
    end
    turtle.up()
    switchSlots()
    turtle.placeDown()
end

print(bridge(args))
-- The first argument is the length
-- local requiredBlocks = arguments[1] * 3
-- if requiredBlocks > availableBlocks then
--     print("Bridge requires ", requiredBlocks, " blocks, but only", availableBlocks, "blocks are available. Needs ",
--         requiredBlocks - availableBlocks, "more blocks")
-- end
-- print("Attempting to build a ", math.floor(bridgeLength), " block long bridge")
-- for i = 1, bridgeLength do
--     turtle.turnLeft()
--     if not bridgePlace() then
--         break
--     end
--     turtle.turnRight()
--     turtle.turnRight()
--     if not bridgePlace() then
--         break
--     end
--     turtle.turnLeft()
--     if turtle.back() then
--         if not bridgePlace() then
--             break
--         end
--     else
--         print("Obstruction. Can't continue")
--         break
--     end
-- end
-- turtle.up()
-- turtle.placeDown()
