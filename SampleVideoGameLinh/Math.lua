-----------------------------------------------------------------------------------------
--
-- game_level1.lua
-- Created by: Jadon
-- Date: Nov. 22nd, 2014
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "Math"

-- Creating Scene Object
local scene = composer.newScene( sceneName )

------------------------------------------------------------------------------------------
-- LOCAL VARIABLES 
------------------------------------------------------------------------------------------

-- Create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

-- Additional local variables
local incorrectObject
local pointsObject
local points = 0
local randomOperator
local randomNumber3
local randomNumber4

-------------------------------------------------------------------------------------------
-- SOUNDS
-------------------------------------------------------------------------------------------

-- Correct sound
local correctSound = audio.loadSound("Sounds/correct.mp3")
local correctSoundChannel

-- Wrong Sound
local wrongSound = audio.loadSound("Sounds/wrong.mp3")
local wrongSoundChannel

-------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------------------

local function AskQuestion()
-- generate a random number between 1 and 4
    randomOperator = math.random(1, 4)

    -- generate 2 random numbers between a max. and a min. number
    randomNumber1 = math.random(10, 20)
    randomNumber2 = math.random(10, 20)
    randomNumber3 = math.random(0, 10)
    randomNumber4 = math.random(0, 10)

    -- display points 
    pointsObject.text = "Points" .. " = " .. points

    if (randomOperator == 1) then 

        -- calculate the correct answer
        correctAnswer = randomNumber1 + randomNumber3

        -- create question in text object
        questionObject.text = randomNumber1 .. " + " .. randomNumber3 .. " = "

    -- otherwise, if the random operator is 2, do subtraction
    elseif (randomOperator == 2) then
        correctAnswer = randomNumber2 - randomNumber4
            
        -- create question in text object 
        questionObject.text = randomNumber2 .. " - " .. randomNumber4 .. " = "
    end

        -- otherwise, if the random operator is 4, do multiplication
    if (randomOperator == 3) then
            correctAnswer = randomNumber3 * randomNumber4 

        -- create question in text object
        questionObject.text = randomNumber3 .. " x " .. randomNumber4 .. " = "

    end
end

local function HideCorrect()
    correctObject.isVisible = false
    AskQuestion()
end

local function HideIncorrect()
    incorrectObject.isVisible = false
    AskQuestion()
end

-- Creating Transitioning Function back to main menu
local function BackTransition()
    composer.gotoScene( "level1_screen", {effect = "zoomInOutFade", time = 500})
    numericField = false
end

-- Creating transitioning funtion to restart when you win or you lose
local function Restart()
    NumericFieldListener()
    UpdateTime()
    lives = 3

end

local function NumericFieldListener(event)

    -- User begins editing "numericField"
    if (event.phase == "began") then

        -- clear text field
        event.target.text = ""

    elseif event.phase == "submitted" then

        -- when the answer is submitted (enter key is pressed) set user input to user's answer
        userAnswer = tonumber(event.target.text)

        -- if the users answer is correct
        if (userAnswer == correctAnswer) then
            correctObject.isVisible = true
            incorrectObject.isVisible = false
            correctSoundChannel = audio.play(correctSound)
            timer.performWithDelay(1500, HideCorrect)
            points = points + 1
            pointsObject.text = "Points" .. " = ".. points

        elseif (userAnswer) then
            correctObject.isVisible = false
            incorrectObject.isVisible = true
            wrongSoundChannel = audio.play(wrongSound)
            timer.performWithDelay(1500, HideIncorrect)
            BackTransition()

        end
    end 
end

------------------------------------------------------------------------------------------
-- OBJECT CREATION
------------------------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 70)
questionObject:setTextColor(0/255, 0/255, 0/255)

-- displays points and sets the colour
pointsObject = display.newText("", 300, 150, Arial, 30)
pointsObject:setTextColor(128/255, 128/255, 128/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight/3, nil, 100)
correctObject:setTextColor(50/255, 128/255, 50/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible 
incorrectObject = display.newText("Incorrect", display.contentWidth/2, display.contentHeight/3, nil, 100)
incorrectObject:setTextColor(70/255, 90/255, 120/255)
incorrectObject.isVisible = false
-- Create numeric field
numericField = native.newTextField(500, display.contentWidth/2, display.contentHeight/2, 100, 100)
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    ----------------------------------------------------------------------------------
    --adding objects to the scene group
    ----------------------------------------------------------------------------------
 
    sceneGroup:insert(questionObject)
    sceneGroup:insert(pointsObject)
    sceneGroup:insert(correctObject)
    sceneGroup:insert(incorrectObject)
    sceneGroup:insert( numericField )

end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).    
        

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        AskQuestion()

    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- Custom function for resuming the game (from pause state)
function scene:resumeGame()
   composer.hideOverlay( "fade", 400)
end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------


-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene