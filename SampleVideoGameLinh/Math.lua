-----------------------------------------------------------------------------------------
--
-- game_level1.lua
-- Created by: Jadon
-- Date: Nov. 22nd, 2014
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------



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

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------


-- Background and other images
local bkg_image
local x = display.newImage("Images/X.png", 350, 350)
x.x = display.contentCenterX
x.y = display.contentCenterY
x.isVisible = false

local check = display.newImage("Images/Check.png", 350, 350)
check.x = display.contentCenterX
check.y = display.contentCenterY
check.isVisible = false



local liveText = display.newText("Lives: ".. userLives, 0, 0, arial, 50 )
liveText.anchorX = 0
liveText.anchorY = 0
liveText.x = 10
liveText.y = 10
liveText:setFillColor(1, 1, 1)


-- boolean variables telling me which answer box was touched
local answerboxAlreadyTouched= false 
local alternateAnswerBox1AlreadyTouched= false
local alternateAnswerBox2AlreadyTouched= false 
local alternateAnswerBox3AlreadyTouched= false

--create answerbox alternate answers and the boxes to show them
local answerbox
local alternateAnswerBox1
local alternateAnswerBox2
local alternateAnswerBox3

-- the black box where the user will drag the answer
local userAnswerBoxPlaceholder

-- Variables containing the user answer and the actual answer

-- displays the answer and whether or not the answer was correct
local answerText

local numberOfLevelQuestions = 0
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

--the text that displays the question
local questionText = display.newText( "" , 0, 0, nil, 100)
--initiate variables and the question text
questionText.x = display.contentWidth * 0.3
questionText.y = display.contentHeight * 0.9

-- Variables containing the user answer and the actual answer
local answer = 0
local userAnswer = 0

answerText = display.newText("", 0, 0, nil, 60)
answerText.x = display.contentWidth * 0.2
answerText.y = display.contentHeight * 0.2
answerText.alpha = 0

--Gives feedback to the user on their answer
responseText = display.newText ("", 0, 0, nil, 100)
responseText.x = display.contentWidth * 0.2
responseText.y = display.contentHeight * 0.4
responseText.rotation = -20
responseText:setFillColor(176/256, 23/256, 15/256)

-- boolean variables stating whether or not the answer was touched
answerboxAlreadyTouched = false
alternateAnswerBox1AlreadyTouched = false
alternateAnswerBox2AlreadyTouched = false
alternateAnswerBox3AlreadyTouched = false

--create answerbox alternate answers and the boxes to show them
answerbox = display.newText("", display.contentWidth * 0.9, 0, nil, 100)
alternateAnswerBox1 = display.newText("", 0, 0, nil, 100)
alternateAnswerBox2 = display.newText("", 0, 0, nil, 100)
alternateAnswerBox3 = display.newText("", 0, 0, nil, 100)

-- the black box where the user will drag the answer
local userAnswerBoxPlaceholder = display.newImageRect("Images/userAnswerBoxPlaceholder.png",  130, 130, 0, 0)
userAnswerBoxPlaceholder.x = display.contentWidth * 0.6
userAnswerBoxPlaceholder.y = display.contentHeight * 0.9

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function livesReset()
    liveText.text = "Lives: " .. userLives
end

local function backToLVone()
    composer.gotoScene( "level1_screen", {effect = "zoomInOutFade", time = 1000})
end

local function backToLVtwo()
    composer.gotoScene( "level2_screen", {effect = "zoomInOutFade", time = 1000})
end

local function LevelStartDelay()
    timer.performWithDelay(1600, LevelStart)
end 

local function YouLoseTransition()
    composer.gotoScene( "you_Lose", {effect = "zoomInOutFade", time = 1000})
end

local function hideCheckRestart()

    check.isVisible = false
    backToLVone()
    
end

local function hideCheckRestart2()

    check.isVisible = false
    backToLVtwo()
    
end

local function hideXRestart()

    x.isVisible = false
    LevelStart()
end

local function ResetAnswerboxBooleans()
    answerboxAlreadyTouched= false 
    alternateAnswerBox1AlreadyTouched= false
    alternateAnswerBox2AlreadyTouched= false 
    alternateAnswerBox3AlreadyTouched= false

end

local function TouchListenerAnswerbox(touch)
    
    --only work if none of the other boxes have been touched
        if alternateAnswerBox1AlreadyTouched == false and alternateAnswerBox2AlreadyTouched == false and alternateAnswerBox3AlreadyTouched == false then

            if touch.phase == "began" then
                --let other boxes know it has been clicked
                answerboxAlreadyTouched = true

            elseif touch.phase == "moved" then
                --dragging function
                answerbox.x = touch.x
                answerbox.y = touch.y
            elseif touch.phase == "ended" then
                answerboxAlreadyTouched = false

                -- if the box is in the userAnswerBox Placeholder  go to center of placeholder
                if (((userAnswerBoxPlaceholder.x - userAnswerBoxPlaceholder.width/2) < answerbox.x ) and
                    ((userAnswerBoxPlaceholder.x + userAnswerBoxPlaceholder.width/2) > answerbox.x ) and 
                    ((userAnswerBoxPlaceholder.y - userAnswerBoxPlaceholder.height/2) < answerbox.y ) and 
                    ((userAnswerBoxPlaceholder.y + userAnswerBoxPlaceholder.height/2) > answerbox.y ) ) then

                    answerbox.x = display.contentWidth * 0.6
                    answerbox.y = display.contentHeight * 0.9
                    userAnswer = answer

                     UserAnswerInput()

                --else make box go back to where it was
                else
                    answerbox.x = display.contentWidth * 0.9
                    answerbox.y = answerboxPreviousY
                end
            end
        end                
end -- end of TouchListenerAnswerbox(touch)

local function TouchListenerAnswerBox1(touch)
    --only work if none of the other boxes have been touched
        if alternateAnswerBox2AlreadyTouched == false and answerboxAlreadyTouched == false and alternateAnswerBox3AlreadyTouched == false then

            if touch.phase == "began" then
                --let other boxes know it has been clicked
               alternateAnswerBox1AlreadyTouched = true
            
             elseif touch.phase == "moved" then
                --dragging function
               alternateAnswerBox1.x = touch.x
               alternateAnswerBox1.y = touch.y

             elseif touch.phase == "ended" then
                alternateAnswerBox1AlreadyTouched = false
                -- if the box is in the userAnswerBox Placeholder  go to center of placeholder
                if (((userAnswerBoxPlaceholder.x - userAnswerBoxPlaceholder.width/2) < alternateAnswerBox1.x ) and 
                    ((userAnswerBoxPlaceholder.x + userAnswerBoxPlaceholder.width/2) > alternateAnswerBox1.x ) and 
                    ((userAnswerBoxPlaceholder.y - userAnswerBoxPlaceholder.height/2) < alternateAnswerBox1.y ) and 
                    ((userAnswerBoxPlaceholder.y + userAnswerBoxPlaceholder.height/2) > alternateAnswerBox1.y ) ) then

                    alternateAnswerBox1.x = display.contentWidth * 0.6
                    alternateAnswerBox1.y = display.contentHeight * 0.9
                    userAnswer = alternateNumber1

                    UserAnswerInput()

                --else make box go back to where it was
                else
                alternateAnswerBox1.x = display.contentWidth * 0.9
                alternateAnswerBox1.y = alternateAnswerBox1PreviousY
                end
            end
        end

end -- end of TouchListenerAnswerBox1(touch)

local function TouchListenerAnswerBox2(touch)
    --only work if none of the other boxes have been touched
        if alternateAnswerBox1AlreadyTouched == false and answerboxAlreadyTouched == false and alternateAnswerBox3AlreadyTouched == false then

            if touch.phase == "began" then
                --let other boxes know it has been clicked
               alternateAnswerBox2AlreadyTouched = true
            
             elseif touch.phase == "moved" then
                --dragging function
               alternateAnswerBox2.x = touch.x
               alternateAnswerBox2.y = touch.y

             elseif touch.phase == "ended" then
                alternateAnswerBox2AlreadyTouched = false

                -- if the box is in the userAnswerBox Placeholder  go to center of placeholder
                if (((userAnswerBoxPlaceholder.x - userAnswerBoxPlaceholder.width/2) < alternateAnswerBox2.x ) and 
                    ((userAnswerBoxPlaceholder.x + userAnswerBoxPlaceholder.width/2) > alternateAnswerBox2.x ) and 
                    ((userAnswerBoxPlaceholder.y - userAnswerBoxPlaceholder.height/2) < alternateAnswerBox2.y ) and 
                    ((userAnswerBoxPlaceholder.y + userAnswerBoxPlaceholder.height/2) > alternateAnswerBox2.y ) ) then

                    alternateAnswerBox2.x = display.contentWidth * 0.6
                    alternateAnswerBox2.y = display.contentHeight * 0.9
                    userAnswer = alternateNumber2

                    UserAnswerInput()

                --else make box go back to where it was
                else
                alternateAnswerBox2.x = display.contentWidth * 0.9
                alternateAnswerBox2.y = alternateAnswerBox2PreviousY
                end
            end
        end

end -- end of TouchListenerAnswerBox2(touch)
    
local function TouchListenerAnswerBox3(touch)
    --only work if none of the other boxes have been touched
        if alternateAnswerBox1AlreadyTouched == false and alternateAnswerBox2AlreadyTouched == false and answerboxAlreadyTouched == false then

            if touch.phase == "began" then
                --let other boxes know it has been clicked
                alternateAnswerBox3AlreadyTouched = true
           
            elseif touch.phase == "moved" then
                --dragging function
                alternateAnswerBox3.x = touch.x
                alternateAnswerBox3.y = touch.y

            elseif touch.phase == "ended" then

                alternateAnswerBox3AlreadyTouched = false
                -- if the box is in the userAnswerBox Placeholder go to center of placeholder
                if (((userAnswerBoxPlaceholder.x - userAnswerBoxPlaceholder.width/2) < alternateAnswerBox3.x ) and 
                    ((userAnswerBoxPlaceholder.x + userAnswerBoxPlaceholder.width/2) > alternateAnswerBox3.x ) and 
                    ((userAnswerBoxPlaceholder.y - userAnswerBoxPlaceholder.height/2) < alternateAnswerBox3.y ) and 
                    ((userAnswerBoxPlaceholder.y + userAnswerBoxPlaceholder.height/2) > alternateAnswerBox3.y ) ) then

                    alternateAnswerBox3.x = display.contentWidth * 0.6
                    alternateAnswerBox3.y = display.contentHeight * 0.9
                    userAnswer = alternateNumber3

                    UserAnswerInput()

                --else make box go back to where it was
                else

                alternateAnswerBox3.x = display.contentWidth * 0.9
                alternateAnswerBox3.y = alternateAnswerBox3PreviousY

                end
            end
        end
end --end of TouchListenerAnswerBox3(touch)
    

local function AddAnswerBoxEventListeners()
    print ("***Math.lua - added answer box event listeners")
    answerbox:addEventListener("touch", TouchListenerAnswerbox)
    alternateAnswerBox1:addEventListener("touch", TouchListenerAnswerBox1)
    alternateAnswerBox2:addEventListener("touch", TouchListenerAnswerBox2)
    alternateAnswerBox3:addEventListener("touch", TouchListenerAnswerBox3)

end -- end of AddAnswerBoxEventListeners()

local function RemoveAnswerBoxEventListeners()
    print ("***Math.lua - removed answer box event listeners")
    answerbox:removeEventListener("touch", TouchListenerAnswerbox)
    alternateAnswerBox1:removeEventListener("touch", TouchListenerAnswerBox1)
    alternateAnswerBox2:removeEventListener("touch", TouchListenerAnswerBox2)
    alternateAnswerBox3:removeEventListener("touch", TouchListenerAnswerBox3)

end -- end of AddAnswerBoxEventListeners()

function UserAnswerInput()
    local animationNumber
    animationNumber = math.random(1,3)
    RemoveAnswerBoxEventListeners()

    numberOfLevelQuestions = numberOfLevelQuestions + 1
        
    ----------------------------------------------------------------------------------
    --disable buttons
    ----------------------------------------------------------------------------------

    answerboxAlreadyTouched = true
    alternateAnswerBox1AlreadyTouched = true
    alternateAnswerBox2AlreadyTouched = true
    alternateAnswerBox3AlreadyTouched = true

    --Change the response text
        
        -- if the user gets the right answer, tell them so
        if (userAnswer == answer)and
           (lvNumber == 1) then

            check.isVisible = true

            pumpkinNumber = pumpkinNumber + 1
            
            timer.performWithDelay( 2000, hideCheckRestart)             
        end

        if (userAnswer == answer)and
           (lvNumber == 2) then

            check.isVisible = true

            pumpkinNumber = pumpkinNumber + 1
            
            timer.performWithDelay( 2000, hideCheckRestart2)             
        end


        if (userAnswer ~= answer) then
            userLives = userLives - 1  
            liveText.text = "Lives: " .. userLives

            
            x.isVisible = true

            timer.performWithDelay( 1000, hideXRestart )
        end

        --if player loses all lives then go to the you lose screen
        if (userLives == 0) then

            YouLoseTransition()
        end 
end

------------------------------------------------------------------------------







local function DisplayQuestion()
    local randomNumber1
    local randomNumber2

    --set random numbers
    randomNumber1 = math.random(9, 20)
    randomNumber2 = math.random(6, 19)

    questionText.text = randomNumber1 .. " + " .. randomNumber2 .. " = " 
    --calculate answer

    randomNumber1 = tonumber( randomNumber1 )
    randomNumber2 = tonumber( randomNumber2 )

    answer = randomNumber1 + randomNumber2
end

local function DisplayAnswers()
        local alternateNumber1
        local alternateNumber2
        local alternateNumber3       
        
        --make sure boxes are not clicked at the beginning
        answerboxAlreadyTouched = false
        alternateAnswerBox1AlreadyTouched = false
        alternateAnswerBox2AlreadyTouched = false
        alternateAnswerBox3AlreadyTouched = false

        --set response text to nothing
        responseText.text = ""         

        --make a different answer to the correct answer.
        alternateNumber1 = answer + math.random(3, 5)
        alternateAnswerBox1.text = alternateNumber1

        alternateNumber2 = answer - math.random(1, 2)
        --set random number to alternate option
        alternateAnswerBox2.text = alternateNumber2

        alternateNumber3 = answer + math.random(1, 2)
        --set random number to alternate option
        alternateAnswerBox3.text = alternateNumber3   

        
        answerbox.text = answer
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--ROMDOMLY SELECT ANSWER BOX POSITIONS
-----------------------------------------------------------------------------------------
    alternateAnswerBox1.x = display.contentWidth * 0.9
    alternateAnswerBox2.x = display.contentWidth * 0.9
    alternateAnswerBox3.x = display.contentWidth * 0.9
    answerbox.x = display.contentWidth * 0.9

    answerbox.y = math.random(1,4)

    -------------------------
    --situation 1
    if (answerbox.y == 1) then
        answerbox.y = display.contentHeight * 0.4

        --alternateAnswerBox2
        alternateAnswerBox2.y = display.contentHeight * 0.70

        --alternateAnswerBox1
        alternateAnswerBox1.y = display.contentHeight * 0.55

        --alternateAnswerBox3
        alternateAnswerBox3.y = display.contentHeight * 0.85

        ---------------------------------------------------------
        --remembering their positions
        alternateAnswerBox1PreviousY = alternateAnswerBox1.y
        alternateAnswerBox2PreviousY = alternateAnswerBox2.y
        alternateAnswerBox3PreviousY = alternateAnswerBox3.y
        answerboxPreviousY = answerbox.y 

    --situation 2
    elseif (answerbox.y == 2) then

        answerbox.y = display.contentHeight * 0.55
        
        --alternateAnswerBox2
        alternateAnswerBox2.y = display.contentHeight * 0.85

        --alternateAnswerBox1
        alternateAnswerBox1.y = display.contentHeight * 0.40

        --alternateAnswerBox3
        alternateAnswerBox3.y = display.contentHeight * 0.70


        alternateAnswerBox1PreviousY = alternateAnswerBox1.y
        alternateAnswerBox2PreviousY = alternateAnswerBox2.y
        alternateAnswerBox3PreviousY = alternateAnswerBox3.y
        answerboxPreviousY = answerbox.y 

    --situation 3
     elseif (answerbox.y == 3) then
        answerbox.y = display.contentHeight * 0.70

        --alternateAnswerBox2
        alternateAnswerBox2.y = display.contentHeight * 0.55

        --alternateAnswerBox1
        alternateAnswerBox1.y = display.contentHeight * 0.85

        --alternateAnswerBox3
        alternateAnswerBox3.y = display.contentHeight * 0.40

        alternateAnswerBox1PreviousY = alternateAnswerBox1.y
        alternateAnswerBox2PreviousY = alternateAnswerBox2.y
        alternateAnswerBox3PreviousY = alternateAnswerBox3.y
        answerboxPreviousY = answerbox.y 

    --situation 4
     elseif (answerbox.y == 4) then
        answerbox.y = display.contentHeight * 0.85

        --alternateAnswerBox2
        alternateAnswerBox2.y = display.contentHeight * 0.40

        --alternateAnswerBox1
        alternateAnswerBox1.y = display.contentHeight * 0.70

        --alternateAnswerBox3
        alternateAnswerBox3.y = display.contentHeight * 0.55

        alternateAnswerBox1PreviousY = alternateAnswerBox1.y
        alternateAnswerBox2PreviousY = alternateAnswerBox2.y
        alternateAnswerBox3PreviousY = alternateAnswerBox3.y
        answerboxPreviousY = answerbox.y 

    end
    
end

--[[local function displayScore()


end]]--
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--Starts the level
----------------------------------------------------------------------------------

function LevelStart()
        DisplayQuestion()
        DisplayAnswers()             
        AddAnswerBoxEventListeners()
        ResetAnswerboxBooleans()    
                
end


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    ----------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------
    --Inserting backgroud image and lives
    ----------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImageRect("Images/Game Screen.png", 2048, 1536)
    bkg_image.anchorX = 0
    bkg_image.anchorY = 0
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight


    ----------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------
    --adding objects to the scene group
    ----------------------------------------------------------------------------------
 
    sceneGroup:insert( bkg_image ) 
    sceneGroup:insert( questionText ) 
    sceneGroup:insert( userAnswerBoxPlaceholder )
    sceneGroup:insert( answerbox )
    sceneGroup:insert( alternateAnswerBox1 )
    sceneGroup:insert( alternateAnswerBox2 )
    sceneGroup:insert( alternateAnswerBox3 )
    sceneGroup:insert( answerText )
    sceneGroup:insert( x )
    sceneGroup:insert( liveText ) 
    sceneGroup:insert( check )

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
        LevelStart()
        livesReset()

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