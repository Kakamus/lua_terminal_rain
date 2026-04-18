local socket = require("socket")

local width = 60
local height = 20
local drops = {}

for i = 1, width do
    drops[i] = math.random(1, height)
end

while true do
    io.write('\27[H')
    for y = 1, height do
        for x = 1, width do
            if drops[x] == y then
                io.write('|')
            else
                io.write(' ')
            end
        end
        io.write('\n')
    end

    for x = 1, width do
        if drops[x] < height then
            drops[x] = drops[x] + 1
        else
            drops[x] = 1
        end
    end

    socket.sleep(0.05)
end