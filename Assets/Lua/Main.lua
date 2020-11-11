local breakSocketHandle,debugXpCall = require("LuaDebugjit")("localhost",7003)
local timer = Timer.New(function() 
breakSocketHandle() end, 1, -1, false)
timer:Start();

function main()
    print("Game Start!")

    
end