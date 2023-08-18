local eturtle = require("eturtle")
local usage = "Usage: excavate <diameter: positive integer>"
local args = { ... }
if #args < 1 then print(usage) end
local width, length, depth
if #args < 1 then width = 16 else width = tonumber(args[1]) end
if #args < 2 then length = width else length = tonumber(args[2]) end
if #args < 3 then depth = 0 else depth = tonumber(args[3]) end
local lx, ly, lz = 0, 0, 0 -- Coords of the last mined block
local x, y, z = 0, 0, 0 -- Coords of the turtle relative to starting point


--[[ TODO:
-- Take in the diameter
-- Break the plane I'm in
-- go down 2 columns if I can
-- if I can't break the plane I in
-- Break the plane above me, around me, and below me at once.
-- Drop down, continue
--]]
-- function rotate(angle)
--     local rotations = math.tointeger(angle / 90)
--     if rotations > 4 then
--         rotations = rotations % 4
--     end
--     if rotations > 2 then
--         for i=1,rotations do
--             turtle.turnRight()
--         end
--     else
--         for i=1,rotations do
--             turtle.turnLeft()
--         end
--     end
-- end
-- function move(distance)
--     for i = 1,distance do
--         turtle.forward()
--     end
-- end
-- function back(distance)
--     for i = 1,distance do
--         turtle.back()
--     end
-- end
-- function up(distance)
--     for i = 1,distance do
--         turtle.up()
--     end
-- end
-- function down(distance)
--     for i = 1,distance do
--         turtle.down()
--     end
-- end
-- function digLayer()
--     turtle.dig()
-- end
