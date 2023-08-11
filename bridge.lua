local arguments = { ... }
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

local function bridgePlace()
    local result = { turtle.place() }
    if not result[1] then -- If the place failed
        print(result[2])
        if result[2] == "No items to place" then
            if not switchSlots() then
                print("Cannot switch slots, Can't continue")
                return false
            end
        elseif result[2] == "Cannot place block here" then
            -- Currently, do nothing
        end
    end
    return true
end

-- The first argument is the length
local availableBlocks = buildingBlocks()
-- local requiredBlocks = arguments[1] * 3
-- if requiredBlocks > availableBlocks then
--     print("Bridge requires ", requiredBlocks, " blocks, but only", availableBlocks, "blocks are available. Needs ",
--         requiredBlocks - availableBlocks, "more blocks")
-- end
local bridgeLength = ((availableBlocks / 3) - 1)
print("Attempting to build a ", math.floor(bridgeLength), " block long bridge")
for i = 1, bridgeLength do
    turtle.turnLeft()
    if not bridgePlace() then
        break
    end
    turtle.turnRight()
    turtle.turnRight()
    if not bridgePlace() then
        break
    end
    turtle.turnLeft()
    if turtle.back() then
        if not bridgePlace() then
            break
        end
    else
        print("Obstruction. Can't continue")
        break
    end
end
turtle.up()
turtle.placeDown()
