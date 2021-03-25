--made by TEC_NO
--Fuel goes to slot 16
--TEC_NO's Remote Control Script!
--Version 0.4 release, build/test 14
 
shell.run('clear') -- Clears Screen For Start 
os.setComputerLabel("TEC_NO's Remote Control Script!")
label = ("TEC_NO's Turtle Remote Control Script!")
sleep(1)
print("Starting program...")
sleep(1)
print("--------------------------")
print("Version 0.4 release, build/test 14")
print("--------------------------")
print("Welcome To TEC_NO's Turtle Remote Control Script")
print("--------------------------")
print("Hello I'm Ready To Start!")
print("--------------------------")
print("Fuel goes to slot 16")
print("--------------------------")
print("What will my name be?")
local setname = read()
print("--------------------------")
print("Please wait a sec!")
sleep(1)
os.setComputerLabel(setname)
label = (setname)
print("--------------------------")
print("This Turtle ID: " .. os.getComputerID() .. ".")
print(" ")
write('Host ID: ')
sender = read()
os.setComputerLabel("Turtle Controler, ID: ".. sender .."!")
print("--------------------------")
sleep(1)
print("Alright, Starting...")
sleep(4)
os.setComputerLabel(setname)
label = (setname)
print("Done!")
print(" ")
print("Turtle Stats:")
print("Host ID: " .. sender .. " | Turtle ID: " .. os.getComputerID() .. "!")
print("Fuel Level: " .. turtle.getFuelLevel() .. " | Turtle Name: " .. setname .. " ")
write('Press Any Key To Start!')
local anykey = read()
print("Alright, I'm Ready!")
--ask for host id
 
sleep(1)
 
function fuelling()
    if turtle.getFuelLevel() <= 10 then
        print("Adding Fuel...")
        os.setComputerLabel("Adding Fuel...")
        label = ("Adding Fuel...")
        turtle.select(16)
        turtle.refuel(1)
        turtle.select(1)
        print("Done.")
        os.setComputerLabel(setname)
        label = (setname)
    end
end
 
function fuelling2()
    print("Adding Fuel...")
    os.setComputerLabel("Adding Fuel...")
    label = ("Adding Fuel...")
    turtle.select(16)
    turtle.refuel(1)
    turtle.select(1)
    print("Done.")
    os.setComputerLabel(setname)
    label = (setname)
end
 
shell.run('clear') --clear the screen
 rednet.open("right") --open the wifi port
 x=1
 while x == 1 do --start loop
 action, senderID, text = os.pullEvent() --wait for input
 if action == "rednet_message" then --if its a wireless message do
 if text == 'forward' then -- if the up button is pressed
 fuelling()
 turtle.forward() -- go forward
 end
 if text == 'backward' then --you know...
 turtle.back()
 end
 if text == 'refuel' then
 fuelling2()
 end
 if text == 'left' then
 turtle.turnLeft()
 end
 if text == 'right' then
 turtle.turnRight()
 end
 if text == 'up' then
 if turtle.detectUp() then
 turtle.digUp()
 else
 turtle.up()
 end
 end
 if text == 'down' then
 if turtle.detectDown() then
 turtle.digDown()
 else
 turtle.down()
 end
 end
 
 
 
 if text == 'dig' then -- if the space button is pressed on dig mode
 turtle.dig() -- dig forward
 end
 if text == 'place' then -- if the space button is pressed on place mode
 turtle.place() --place the selected block in front
 end
 if text == 'rs' then -- if the key is pressed
 redstone.setOutput('front', true) -- set redstone in front to true
 if action=="key" and senderID == sender then -- check sender id
 x=0
 end
 end
 end
 end