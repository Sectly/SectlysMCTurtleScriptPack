--made by TEC_NO
--Make sure to add fuel to turtle
--TEC_NO's Remote Control Script!
--Version 0.4 release, build/test 14
 
os.setComputerLabel("TEC_NO's Remote Control Script! | Computer ID:" .. os.getComputerID() .. "!")
print("Starting program...")
sleep(1)
print("--------------------------")
print("Version 0.4 release, build/test 14")
print("--------------------------")
print("Welcome To TEC_NO's Turtle Remote Control Script | Computer ID:" .. os.getComputerID() .. "!")
print("--------------------------")
write('Press Any Key To Continue!')
local anykey = read()
print("Help & Info Menu:")
print(" ")
print("Refueling:")
print("R = Refuel")
print(" ")
write('Press Any Key To Continue!')
local anykey = read()
print(" ")
print("Movement:")
print("W = Forwards")
print("S = Backwards")
print("A = Left")
print("D = Right")
print("Q = Down")
print("E = Up")
print(" ")
write('Press Any Key To Continue!')
local anykey = read()
print(" ")
print("Blocks:")
print("F = Check Mode")
print("Spacebar = Dig/Place, Depends On Mode")
print("X = Place Mode")
print("Z = Dig Mode")
print(" ")
write('Press Any Key To Continue!')
local anykey = read()
print(" ")
print("Extra:")
print("T = Last Movement/Objective")
print("C = Redstone Activated")
print(" ")
write('Press Any Key To Continue!')
local anykey = read()
print(" ")
print("Thats All!")
print("--------------------------")
write('Please enter the bot\'s id: ')
bot = tonumber(read()) -- the ID of the turtle
print("--------------------------")
print("Note:")
print("If the script does not work please check the script.")
print("--------------------------")
print("Loading, Please Wait!")
sleep(4)
print("Starting...")
os.setComputerLabel("Turtle Controler, ID: ".. bot .."!")
sleep(4)
print("Done!")
sleep(1)
 
shell.run('clear') --clear the screen
 
obj = 14
mode = 0 -- set the mode to dig
rednet.open('back') -- open wifi port
while true do -- start infinite loop
event, key = os.pullEvent() -- wait for input
shell.run('clear') -- clear the screen again :P
if key == 's' then --if the s button is pressed
rednet.send(bot, 'backward')-- send message for down button
print('Backward') -- write on the screen
obj = 1
end
if key == 'r' then --up
rednet.send(bot, 'refuel')
print('ReFueling')
obj = 6
end
if key == 'a' then -- left
rednet.send(bot, 'left')
print('Left')
obj = 2
end
if key == 'w' then --up
rednet.send(bot, 'forward')
print('Forward')
obj = 0
end
if key == 'd' then -- right
rednet.send(bot, 'right')
print('Right')
obj = 3
end
if key == 'e' then
rednet.send(bot, 'up')
print('Up')
obj = 4
end
if key == 'q' then
rednet.send(bot, 'down')
print('Down')
obj = 5
end
 
if key == 'f' then
if mode == 0 then
print("Mode = Dig")
elseif mode == 1 then
print("Mode = Place")
else
print("Mode = ERROR, Oops It Seems Ther Was An Error Please Check The Script!")
end
end
if key == ' ' then --if the key is the spacebar
if mode == 0 then -- if on digmode
rednet.send(bot, 'dig') -- send message to dig
print('Dig') -- write it
obj = 9
elseif mode == 1 then -- if on placemode 
rednet.send(bot, 'place') -- send message to place block
print('Place') --write
obj = 8
end
end
if key == 'z' then --if the key is left 
mode = 0 -- set to digmode
print('Dig mode selected.') --write it
obj = 7
end
if key == 'x' then -- if right
mode = 1 -- set to placemode
print('Place mode selected.') --write
obj = 7
end
if key == 'c' then --if the c is pressed
rednet.send(bot, 'rs') -- send message to enable redstone
print('Redstone activated.')-- write
obj = 10
end
if key == 't' then
if obj == 0 then
print("Last Movement/Objective = Forwards")
elseif obj == 1 then
print("Last Movement/Objective = Backwards")
elseif obj == 2 then
print("Last Movement/Objective = Left")
elseif obj == 3 then
print("Last Movement/Objective = Right")
elseif obj == 4 then
print("Last Movement/Objective = Up")
elseif obj == 5 then
print("Last Movement/Objective = Down")
elseif obj == 6 then
print("Last Movement/Objective = Refuel")
elseif obj == 7 then
print("Last Movement/Objective = Dig/Place Mode Changed")
elseif obj == 8 then
print("Last Movement/Objective = Block Placed")
elseif obj == 9 then
print("Last Movement/Objective = Block Removed")
elseif obj == 10 then
print("Last Movement/Objective = Ohter")
elseif obj == 14 then
print("Last Movement/Objective = None")
else
print("Last Movement/Objective = ERROR, Oops It Seems Ther Was An Error Please Check The Script!")
end
end
end
 
-- Thanks for using my script!
--made by TEC_NO
--TEC_NO's Remote Control Script!
--Version 0.4 release, build/test 14