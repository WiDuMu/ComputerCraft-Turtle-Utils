local function slotsLeft()
    print("Checking how many slots are left")
    local slotsLeft = 0
    for i = 1,16 do
        turtle.select(i)
        slotsLeft = slotsLeft + turtle.getItemSpace()
    end
    print("Slots left: ", slotsLeft)
    return slotsLeft
end
while true do
    for i=1,slotsLeft() do
        local tries = 0
        if tries < 20 then
            if turtle.digDown() then
                tries = 0
            else
                tries = tries + 1
            end
        else
            print("Maximum number of tries exceeded: ", tries " Stopping.")
            break
        end
        sleep(0.05 * 22)
    end
    if slotsLeft() == 0 then
        break
    end
end
