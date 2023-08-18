-- A program to benchmark your computercraft programs

local args = { ... }
if #args < 1 then
   print("Enter in your arguments the program and arguments to benchmark")
end

local start = os.clock()
shell.run( unpack(args) )
print("Took ".. (os.clock() - start) .. " seconds")