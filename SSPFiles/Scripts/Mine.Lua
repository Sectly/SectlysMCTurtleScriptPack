--made by TEC_NO
--Fuel goes to slot 16
--Torches goes to slot 15
--chests goes to slot 14
 
os.setComputerLabel("TEC_NO's Turtle Mining Script!")
label = ("TEC_NO's Turtle Mining Script!")
sleep(1)
print("Starting program...")
print("--------------------------")
print("Version 0.4 release, build/test 14")
print("--------------------------")
print("Welcome To TEC_NO's Turtle Mining Script")
print("--------------------------")
print("Hello I'm Ready To Work!")
print("--------------------------")
print("Fuel goes to slot 16")
print("Torches goes to slot 15")
print("Chests goes to slot 14")
print("--------------------------")
print("What will my name be?")
local setname = read()
print("--------------------------")
print("Please wait a sec!")
os.setComputerLabel(setname)
label = (setname)
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
 
function turnAround()
	turtle.turnLeft()
	turtle.turnLeft()
end
 
function turnAround2Left()
	turtle.turnLeft()
	turtle.dig()
	if turtle.detect() then
			for index = 1,5 do
				turtle.dig()
			end
		end
	turtle.forward()
	turtle.digUp()
	turtle.turnLeft()
end
 
function nextPlaceLeft()
	turtle.turnRight()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.turnRight()
end
 
function turnAround2Right()
	turtle.turnRight()
	turtle.dig()
	if turtle.detect() then
			for index = 1,5 do
				turtle.dig()
			end
		end
	turtle.forward()
	turtle.digUp()
	turtle.turnRight()
end
 
function nextPlaceRight()
	turtle.turnLeft()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.turnLeft()
end
 
function tunnelling(givenLenght)
	local distance = 0
	for index = 1,givenLenght do
		if turtle.detect() then
			for index = 1,5 do
				turtle.dig()
			end
		end
		turtle.forward()
		distance = distance + 1
		turtle.digUp()
		turtle.select(1)
		fuelling()
 
		if distance == 10 then
			print("Placing torch...")
            os.setComputerLabel("Placing torch...")
            label = ("Placing torch...")
			turtle.select(15)
			turnAround()
			turtle.place()
			turnAround()
			distance = 0
            os.setComputerLabel(setname)
            label = (setname)
		end
	end
end	
 
function tunnellingBack(givenLenght)
 
	for index = 1,givenLenght do
		if turtle.detect() then
			for index = 1,5 do
				turtle.dig()
			end
		end
		turtle.forward()
		turtle.digUp()
		turtle.select(1)
		fuelling()
	end
 
end	
 
function chestAndDrop()
	turtle.select(14)
	turtle.dig()
	print("Placing chest...")
    os.setComputerLabel("Placing chest...")
    label = ("Placing chest...")
	turtle.place()
	print("Dropping items to chest...")
    os.setComputerLabel("Dropping items to chest...")
    label = ("Dropping items to chest...")
	local selected = 0
	for index = 1,13 do
		selected = selected + 1
		turtle.select(selected)
		print(selected)
		turtle.drop()
	end
	turtle.select(1)
	print("Done!")
    os.setComputerLabel(setname)
    label = (setname)
end
 
 
print("--------------------------")
print("What will be the tunnel lenght?")
local lenght = read()
print("--------------------------")
print("How many tunnels will the turtle make?")
local tunnels = read()
print("--------------------------")
print("Which way the tunnels will go? (left=1/right=2)")
local way = read()
print("--------------------------")
print("Starting TEC_NO's Turtle Mining Script Please Wait...")
print("--------------------------")
print("Starting to work...")
print("--------------------------")
sleep(1)
os.setComputerLabel(setname)
label = (setname)
 
fuelling()
for index = 1,tunnels do
	tunnelling(lenght)
	if way == "1" then
		turnAround2Left()
	elseif way == "2" then
		turnAround2Right()
	else
		print("ERR-1. You have not chosen right or left!")
		return 0
	end
	tunnellingBack(lenght)
	chestAndDrop()
 
	if way == "1" then
		nextPlaceLeft()
	elseif way == "2" then
		nextPlaceRight()
	else
		print("ERR-1. You have not chosen right or left!")
		return 0
	end
end
 
os.setComputerLabel("I'm Done")
label = ("I'm Done!")
print("Program Ended!.")
print("Tunnel(s) are ready.")
print("I'm ready to start again!.")
turtle.turnRight()
turtle.turnLeft()
turtle.turnLeft()
turtle.turnRight()
sleep(1)
os.setComputerLabel(setname)
label = (setname)
print("Program Stopped.")

RAW Paste Data
--made by TEC_NO
--Fuel goes to slot 16
--Torches goes to slot 15
--chests goes to slot 14

os.setComputerLabel("TEC_NO's Turtle Mining Script!")
label = ("TEC_NO's Turtle Mining Script!")
sleep(1)
print("Starting program...")
print("--------------------------")
print("Version 0.4 release, build/test 14")
print("--------------------------")
print("Welcome To TEC_NO's Turtle Mining Script")
print("--------------------------")
print("Hello I'm Ready To Work!")
print("--------------------------")
print("Fuel goes to slot 16")
print("Torches goes to slot 15")
print("Chests goes to slot 14")
print("--------------------------")
print("What will my name be?")
local setname = read()
print("--------------------------")
print("Please wait a sec!")
os.setComputerLabel(setname)
label = (setname)
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

function turnAround()
	turtle.turnLeft()
	turtle.turnLeft()
end

function turnAround2Left()
	turtle.turnLeft()
	turtle.dig()
	if turtle.detect() then
			for index = 1,5 do
				turtle.dig()
			end
		end
	turtle.forward()
	turtle.digUp()
	turtle.turnLeft()
end

function nextPlaceLeft()
	turtle.turnRight()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.turnRight()
end

function turnAround2Right()
	turtle.turnRight()
	turtle.dig()
	if turtle.detect() then
			for index = 1,5 do
				turtle.dig()
			end
		end
	turtle.forward()
	turtle.digUp()
	turtle.turnRight()
end

function nextPlaceRight()
	turtle.turnLeft()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.turnLeft()
end
	
function tunnelling(givenLenght)
	local distance = 0
	for index = 1,givenLenght do
		if turtle.detect() then
			for index = 1,5 do
				turtle.dig()
			end
		end
		turtle.forward()
		distance = distance + 1
		turtle.digUp()
		turtle.select(1)
		fuelling()
	
		if distance == 10 then
			print("Placing torch...")
            os.setComputerLabel("Placing torch...")
            label = ("Placing torch...")
			turtle.select(15)
			turnAround()
			turtle.place()
			turnAround()
			distance = 0
            os.setComputerLabel(setname)
            label = (setname)
		end
	end
end	
	
function tunnellingBack(givenLenght)

	for index = 1,givenLenght do
		if turtle.detect() then
			for index = 1,5 do
				turtle.dig()
			end
		end
		turtle.forward()
		turtle.digUp()
		turtle.select(1)
		fuelling()
	end
	
end	

function chestAndDrop()
	turtle.select(14)
	turtle.dig()
	print("Placing chest...")
    os.setComputerLabel("Placing chest...")
    label = ("Placing chest...")
	turtle.place()
	print("Dropping items to chest...")
    os.setComputerLabel("Dropping items to chest...")
    label = ("Dropping items to chest...")
	local selected = 0
	for index = 1,13 do
		selected = selected + 1
		turtle.select(selected)
		print(selected)
		turtle.drop()
	end
	turtle.select(1)
	print("Done!")
    os.setComputerLabel(setname)
    label = (setname)
end


print("--------------------------")
print("What will be the tunnel lenght?")
local lenght = read()
print("--------------------------")
print("How many tunnels will the turtle make?")
local tunnels = read()
print("--------------------------")
print("Which way the tunnels will go? (left=1/right=2)")
local way = read()
print("--------------------------")
print("Starting TEC_NO's Turtle Mining Script Please Wait...")
print("--------------------------")
print("Starting to work...")
print("--------------------------")
sleep(1)
os.setComputerLabel(setname)
label = (setname)

fuelling()
for index = 1,tunnels do
	tunnelling(lenght)
	if way == "1" then
		turnAround2Left()
	elseif way == "2" then
		turnAround2Right()
	else
		print("ERR-1. You have not chosen right or left!")
		return 0
	end
	tunnellingBack(lenght)
	chestAndDrop()
	
	if way == "1" then
		nextPlaceLeft()
	elseif way == "2" then
		nextPlaceRight()
	else
		print("ERR-1. You have not chosen right or left!")
		return 0
	end
end

os.setComputerLabel("I'm Done")
label = ("I'm Done!")
print("Program Ended!.")
print("Tunnel(s) are ready.")
print("I'm ready to start again!.")
turtle.turnRight()
turtle.turnLeft()
turtle.turnLeft()
turtle.turnRight()
sleep(1)
os.setComputerLabel(setname)
label = (setname)
print("Program Stopped.")
