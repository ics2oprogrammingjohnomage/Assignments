-- Title: Animating Images
-- Name: John Omage
-- Course: ICS2O/3C
-- This program  in Lua that has a background 
--with 3 different objects that move around on 
--the screen as well as some coloured text.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--global varibales
scrollSpeed = 1

-- background image with width and height 
local backgroundImage = display .newImageRect("Images/Background3.png", 2048, 1536)

--character image with width and height
local buns = display.newImageRect("Images/buns.png", 200, 200)

--set image to be transparent
buns.alpha = 400

-- ser the initial x and y position of buns
buns.x = 200
buns.y = 200
--function : Moveship 
-- Input: this function accepts and event listener 
-- Output: none 
-- Description: This fuction and adds the scroll speed to the x-value of buns 
local function Movebuns(event)
	-- add the scroll speed to th ex-value of the ship
	buns.y = buns.y + scrollSpeed
	-- change the transparency of th e ship every time it moves so that it fades out 
buns.alpha = buns.alpha + 0.01
end

-- create event listeners 
	Runtime:addEventListener("enterFrame", Movebuns)

	--global variables
 NewScrollSpeed = -2
	
--character image with width and height
local brat = display.newImageRect("Images/pic3.png", 200, 200)

--set image to be transparent
brat.alpha = 400

-- set the initial x and y position of rocketship
brat.x = 800
brat.y = 600
--function : Moveship 
-- Input: tis function accepts and event listener 
-- Output: none 
-- Description: This fuction and adds the scroll speed to the x-value of the ship 
local function Movebrat(event)

	--rotate image
	brat:rotate(190)
		-- move the image
	brat.x = brat.x + NewScrollSpeed
	brat.y = brat.y + NewScrollSpeed
	-- change the transparency of th e ship every time it moves so that it fades out 
	brat.alpha = brat.alpha + 0.01
end
-- create event listeners 
	Runtime:addEventListener("enterFrame", Movebrat)

	--global variables
 newNewScrollSpeed = 2
	
--character image with width and height
local nate = display.newImageRect("Images/pic2.png", 200, 200)

--set image to be transparent
nate.alpha = 400

-- set the initial x and y position of rocketship
nate.x = 200
nate.y = 600
--function : Moveship 
-- Input: tis function accepts and event listener 
-- Output: none 
-- Description: This fuction and adds the scroll speed to the x-value of nate
local function Movenate(event)
		-- move the image
	nate.x = nate.x + newNewScrollSpeed
	-- change the transparency of nate every time it moves so that it fades out 
	nate.alpha = nate.alpha + 0.01
end
-- create event listeners 
	Runtime:addEventListener("enterFrame", Movenate)