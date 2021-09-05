local term = peripheral.find("monitor")
local detector = peripheral.find("playerDetector")

--Monitor Size 6x6
local sizex = 61
local sizey = 40

--Radar Center
local rx = 104
local rz = 7

--Setting up board
function setRadar()
    term.setTextColor(colors.blue)
    term.setCursorPos(31,1)
    term.write("N")
    term.setCursorPos(31,40)
    term.write("S")
    term.setCursorPos(61,20)
    term.write("E")
    term.setCursorPos(1,20)
    term.write("W")
    term.setCursorPos(sizex/2,(sizey/2)-1)
    term.setTextColor(colors.white)
    term.write("House")
    term.setCursorPos(sizex/2+2,sizey/2)
    term.setTextColor(0x4000) 
    term.write("o")
end

--returns chunk position of players
function getChunkPos(player)
    pos = detector.getPlayerPos(player)
    chunkx = (pos["x"]-rx)/16
    chunkz = (pos["z"]-rz)/16
    return (sizex/2)+chunkx,(sizey/2)+chunkz
end

--sets cursor pos at chunk cord where player is
function setChunkDistance(player)
    pos = detector.getPlayerPos(player)
    chunkx = (pos["x"]-rx)/16
    chunkz = (pos["z"]-rz)/16
    term.setCursorPos((sizex/2)+chunkx,(sizey/2)+chunkz)
end

--Function to check for movement
function ppos()
    player = detector.getOnlinePlayers()
    for i=1, #player do
        playerPos={player[i];getChunkPos(player[i])}
    end
    return pp
end

--main iteration loop
while true do
    term.clear()
    local players = detector.getOnlinePlayers()
--sets player position on radar
    for i=1,#players do
        setChunkDistance(players[i])
        term.setTextColor(colors.green)
        term.write(players[i])
        playpos={players[i];getChunkPos(players[i])}
        print(players[i])
    end
    setRadar()
--updates Radar
    sleep(10)
end
        

                
                    
                            
    
    
