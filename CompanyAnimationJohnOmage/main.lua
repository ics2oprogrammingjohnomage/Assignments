







--global variables
 NewScrollSpeed = -2
	
--character image with width and height
local CompanyLogo = display.newImageRect("Images/CompanyLogoJohnO@2x.png", 200, 200)

--set image to be transparent
CompanyLogo.alpha = 400

-- set the initial x and y position of rocketship
CompanyLogo.x = 800
CompanyLogo.y = 600
--function : Moveship 
-- Input: tis function accepts and event listener 
-- Output: none 
-- Description: This fuction and adds the scroll speed to the x-value of the ship 
local function MoveCompanyLogo(event)


		-- move the image
	CompanyLogo.x = CompanyLogo.x + NewScrollSpeed
	CompanyLogo.y = CompanyLogo.y + NewScrollSpeed
	-- change the transparency of th e ship every time it moves so that it fades out 
	CompanyLogo.alpha = CompanyLogo.alpha + 0.01
end
-- create event listeners 
	Runtime:addEventListener("enterFrame", MoveCompanyLogo)

	local jungleSounds = audio.loadSound("Sounds/baa.mp3")
	local jungleSoundsChannel

	 -- start the splash screen music
        jungleSoundsChannel = audio.play(jungleSounds )
