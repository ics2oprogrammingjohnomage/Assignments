-- Title: Math Fun
-- Name: John Omage
-- Course: ICS20/3C
-- this program

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)


-- set the bckg colour
display.setDefault("background", 255/255, 125/255, 0/255)


-- 	LOCAL VARIABLES

-- create local variables
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer
local randomOperator
local correctSound = audio.loadSound( "Sound/Ding.mp3")
local incorrectSound = audio.loadSound( "Sound/Wrong sound.mp3")
local correctSoundChannel
local incorrectSoundChannel

-- variables for the timer
local totalSeconds = 10
local secondsLeft = 10
local clockText = display.newText ("", display.contentWidth/8, display.contentHeight/8, nil, 56)
local countDownTimer

local lives = 3 
local heart1
local heart2
local heart3
local pointsObject
local deathSound = audio.loadSound("Sound/death sound.mp3")
local deathSoundChannel

--local functions

local function roundToFirstDecimal( tmpcorrectAnswer )
	return math.round( tmpcorrectAnswer * 10) *0.1
end

local function AskQuestion()
 -- make a number from 1 and 2
 randomOperator = math.random(1,4)

 randomNumber1 = math.random(6,10)
 randomNumber2 = math.random(1,6)

 -- if the number is 1 then add
 if (randomOperator == 1) then

-- calculate the correct answer
 correctAnswer = randomNumber1 + randomNumber2

 -- creat question in text object 
 questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

 -- if the number is 2 then take away
 	elseif (randomOperator == 2) then

 	--calculate the correct answer
 	correctAnswer = randomNumber1 - randomNumber2

 	-- make the question in text object
 	questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

 	-- if number is 3 then times
	elseif (randomOperator == 3) then

	-- calculate the correct answer 
	correctAnswer = randomNumber1 * randomNumber2

	-- make question in text object 
	questionObject.text = randomNumber1 .." * " .. randomNumber2 .. " = "

		-- if number is 4 then divide
	elseif (randomOperator == 4) then

	-- calculate the correct answer 
	correctAnswer = roundToFirstDecimal(randomNumber1 / randomNumber2)

	-- make question in text object 
	questionObject.text = randomNumber1 .." / " .. randomNumber2 .. " = "
	end
end

local function UpdateTime()

	-- number of seconds
	secondsLeft = secondsLeft - 1

	-- show the number of seconds left in clock text
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0) then
		-- reset the number of secounds
		secondsLeft = totalSeconds
		lives = lives - 1

		if (lives == 2) then
			heart3.isVisible = false
			incorrectSoundChannel = audio.play(incorrectSound)
			AskQuestion()
			elseif (lives == 1) then
			heart2.isVisible = false
			incorrectSoundChannel = audio.play(incorrectSound)
			AskQuestion()
			elseif (lives == 0) then
			heart1.isVisible = false
			deathSoundChannel = audio.play(deathSound)
			timer.cancel(countDownTimer)
		end
	end
end

UpdateTime()
-- calls the timer
local function StartTimer()
	--make a timer that goes on forever
	countDownTimer = timer.performWithDelay( 1000, UpdateTime,0)
end

local function KeepTime()
	timer.resume(countDownTimer)
	secondsLeft = 10
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- user types in the box
	if (event.phase == "began") then

	elseif (event.phase == "submitted") then

		-- when its submitted 
		userAnswer = tonumber(event.target.text)
		-- if the users ans and correct ans are the same
		if (userAnswer == correctAnswer) then
		incorrectObject.isVisible = false
		correctObject.isVisible = true 
		timer.performWithDelay(3000, HideCorrect)
		correctSoundChannel = audio.play(correctSound)
		timer.pause(countDownTimer)
		timer.performWithDelay(2560, KeepTime)

		elseif (userAnswer ~= correctAnswer) then
		incorrectObject.isVisible = true
		correctObject.isVisible = false
		timer.performWithDelay(3000, HideIncorrect)
		lives = lives - 1
		timer.pause(countDownTimer)
		incorrectSoundChannel = audio.play(incorrectSound)
		timer.performWithDelay(2560, KeepTime)
	end
	-- clear text field
	event.target.text = ""
	end
end

-- make the lives show on the ipad
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 5 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 7 / 8
heart3.y = display.contentHeight * 1 / 7

-- shows the question and the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil,50 )
questionObject:setTextColor(255/255, 255/255, 255/255)


-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil,50  )
correctObject:setTextColor(0/255, 211/255, 198/255)
correctObject.isVisible = false

-- create the correct text object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil,50  )
incorrectObject:setTextColor(255/255, 255/255, 0/255)
incorrectObject.isVisible = false

-- make numeric field 
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "decimal"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- fuction calls


-- call the fuction
AskQuestion()
StartTimer()