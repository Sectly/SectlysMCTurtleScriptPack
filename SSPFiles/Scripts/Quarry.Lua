-- NOTE: 8 x 8 x 60
 
 
-- Quarry script by: Sectly.
-- EDIT VARIABLES IN HERE
 
 -- slot numbers are
 -- 1  2  3  4
 -- 5  6  7  8
 -- 9 10 11 12
 -- 13 14 15 16
 
  -- inventory slot number for fuel.
  local SLOT_FUEL = 1
 
  -- default digging size X, Y, Z
  local dDS = { 8, 60, 8 }
 
-- DONT EDIT FROM HERE
 
-- (script local) global variables
  -- argument
  local tArgs = { ... }
 
  -- local coordinate
  -- X, Y, Z, Orientation
  local LC = { 0, 0, 0, 1 }
 
  -- internal table for coordinate system
  -- 1N, 2E, 3S, 4W
  -- X, Z
  local cAdd = { { 0, 1 }, { 1, 0 }, { 0, -1 }, { -1, 0 } }
 
  local td = false
 
-- fuel thingy
function rFuel()
  if turtle.getFuelLevel() < 1 then
    turtle.select(SLOT_FUEL)
    while not turtle.refuel(1) do
      print("OUT OF FUEL!!")
      print("put fuel to slot"..SLOT_FUEL.." then press enter.")
      i = read()
    end
    print("REFUELED")
    print("fuel level = "..turtle.getFuelLevel())
    print("remaining fuel = "..turtle.getItemCount(SLOT_FUEL))
  end
end
 
-- turn
function turn(d)
  if d == "left" then
    turtle.turnLeft()
    LC[4] = LC[4]  - 1
  elseif d == "right" then
    turtle.turnRight()
    LC[4] = LC[4] + 1
  end
 
  if LC[4] > 4 then
    LC[4] = 1
  elseif LC[4] < 1 then
    LC[4] = 4
  end
 
  -- debug
  -- print(LC[4])
end
 
-- flip
function flip()
  turn("right")
  turn("right")
end
 
-- move safely, and calculate the local coordinate (amount, direction)
function move(a, d)
  local i = 1
  local s = false
  
  for i = 1, a do
    rFuel()
    repeat
      if d == "forward" then
        s = turtle.forward()
        if s then
          LC[1] = LC[1] + cAdd[LC[4]][1]
          LC[3] = LC[3] + cAdd[LC[4]][2]
        end
      elseif d == "back" then
        s = turtle.back()
        if s then
          LC[1] = LC[1] - cAdd[LC[4]][1]
          LC[3] = LC[3] - cAdd[LC[4]][2]
        end
      elseif d == "up" then
        s = turtle.up()
        if s then
          LC[2] = LC[2] - 1
        end
      elseif d == "down" then
        s = turtle.down()
        if s then
          LC[2] = LC[2] + 1
        end
      end
    until s == true
  end
  -- debug
  -- print(LC[1] .. ", " .. LC[2] .. ", " .. LC[3])
end
 
-- check if inventory is full(true) or not(false)
function chkInventory()
  local ret = true
  for i = 1, 16 do
    if turtle.getItemSpace(i) == 64 then
      ret = false
    end
  end
  return ret
end
 
-- drop off
function dropoff()
  print("dropping off items")
  local oLC = { LC[1], LC[2], LC[3], LC[4] }
  
  move(oLC[2], "up")
  while LC[4] ~= 4 do
    turn("right")
  end
  move(oLC[1], "forward")
  while LC[4] ~= 3 do
    turn("right")
  end
  move(oLC[3], "forward")
 
  for i = 1, 16 do
    if i ~= SLOT_FUEL then
      turtle.select(i)
      turtle.drop()
    end
  end
 
  while LC[4] ~= 1 do
    turn("right")
  end
  move(oLC[3], "forward")
  while LC[4] ~= 2 do
    turn("right")
  end
  move(oLC[1], "forward")
  move(oLC[2], "down")
  while LC[4] ~= oLC[4] do
    turn("right")
  end
 
  LC = { oLC[1], oLC[2], oLC[3], oLC[4] }
end
 
-- dig a block in front
function digFront()
  if chkInventory() then
    -- Go back and dump shit
    dropoff()
    return turtle.dig()
  else
    return turtle.dig()
  end
end
 
-- dig a block in bottom
function digDown()
  if chkInventory() then
    dropoff()
    return turtle.digDown()
  else
    return turtle.digDown()
  end
end
 
-- mining turn
function turning()
  if LC[4] == 1 then
    if td then
      d = "left"
    else
      d = "right"
    end
  else
    if td then
      d = "right"
    else
      d = "left"
    end
  end
 
  turn(d)
  digFront()
  move(1, "forward")
  turn(d)
end
 
-- main program
 
-- check arguments. if not set, then use default
if #tArgs == 3 then
  dDS[1] = tonumber(tArgs[1])
  dDS[2] = tonumber(tArgs[2])
  dDS[3] = tonumber(tArgs[3])
  print("digging area is set to")
  print("X:"..dDS[1]..", Y:"..dDS[2]..", Z:"..dDS[3])
else
  print("no arguments given. using default size.")
  print("X:"..dDS[1]..", Y:"..dDS[2]..", Z:"..dDS[3])
  print("you can change default by editing the script.")
end
 
for y = 1, dDS[2] do
  for x = 1, dDS[1] do
    if x > 1 then
      turning()
    end
    for z = 1, dDS[3] - 1 do
      while turtle.detect() do
        digFront()
        os.sleep(0.5)
      end
      move(1, "forward")
    end
  end
  while turtle.detectDown() do
    digDown()
  end
  move(1, "down")
  flip()
  td = not td
end
 
move(LC[2], "up")
while LC[4] ~= 4 do
  turn("right")
end
move(LC[1], "forward")
while LC[4] ~= 3 do
  turn("right")
end
move(LC[3], "forward")
for i = 1, 16 do
  if i ~= SLOT_FUEL then
    turtle.select(i)
    turtle.drop()
  end
end
while LC[4] ~= 1 do
  turn("right")
end
 
print("successfully completed operation.")