-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Linh Ho
-- Date: May 6th
-- Description: This is the level 1 screen of the game.
-- Date: May 6th, 2019
-- Description: This is the level 1 screen of the game. The goal of the level screen is 
-- to have a maze game, and everytime the lion collides into something, it transitions 
-- to a math question.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )
local joystick = require( "joystick" )
local physics = require( "physics" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image
local backButton
local joystickPressed = false 
local facingWhichDirection = "right"

local muteButton
local unmuteButton
----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
----------------------------------------------------------------------------------------

restarted = 0
userLives = 3
lvl = 1
meatNumber = 0

-- set the boolean variable to be true
soundOn = true

----------------------------------------------------------------------------------------
-- SOUNDS 
----------------------------------------------------------------------------------------

local firstScreen = audio.loadSound("Sounds/level1Screen.mp3")
local firstScreenChannel

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "zoomInOutFade", time = 500})
end

-- Creating a function which limits the characters' movement to the visible screen

local function ScreenLimit( character )   

    -- Checking if the the character is about to go off the right side of the screen
    if character.x > ( display.contentWidth - character.width / 2 ) then
            
        character.x = character.x - 6.5

    -- Checking if the character is about to go off the left side of the screen
    elseif character.x < ( character.width / 2 ) then

        character.x = character.x + 6.5

    -----------------------------------------------------------------------------------------

    -- Checking if the character is about to go off the bottom of the screen
    elseif character.y > ( display.contentHeight - character.height / 2 ) then

        character.y = character.y - 6.5

    -- Checking if the character is about to off the top of the screen
    elseif character.y < ( character.height / 2 ) then

        character.y = character.y + 6.5

    end
end
 
local function RuntimeEvents()

        -- Retrieving the properties of the joystick
        angle = analogStick:getAngle()
        distance = analogStick:getDistance() -- Distance from the center of the joystick background
        direction = analogStick.getDirection()

        -----------------------------------------------------------------------------------------

        -- Checking if the joystick is being held
        if joystickPressed == true then

            -- Applying the force of the joystick to move the lion
            analogStick:move( lion, 0.75 )

        end

        -----------------------------------------------------------------------------------------

        -- Limiting each character's movement to the edge of the screen
        ScreenLimit( lion )

        -----------------------------------------------------------------------------------------

        -- Checking if the joystick is pointing the opposite direction of the character
        if facingWhichDirection == "left" then
            
            -- Checking if the joystick is pointing to the right
            if direction == 1 or direction == 2 or direction == 8 then

                -- Setting the status of the character's directions
                facingWhichDirection = "right"

            end
        end

        -----------------------------------------------------------------------------------------

        -- Checking if the joystick is pointing the opposite direction of the character
        if facingWhichDirection == "right" then


            -- Checking if the joystick is pointing to the right
            if direction == 4 or direction == 5 or direction == 6 then

                -- Setting the status of the character's directions
                facingWhichDirection = "left"

            end
        end

        -----------------------------------------------------------------------------------------

end -- local function RuntimeEvents( )

-----------------------------------------------------------------------------------
local function AddPhysicsBodies()

    physics.addBody(wall1, "static", {friction = 0})
    physics.addBody(wall2, "static", {friction = 0})
    physics.addBody(wall3, "static", {friction = 0})
    physics.addBody(wall4, "static", {friction = 0})
    physics.addBody(wall5, "static", {friction = 0})
    physics.addBody(wall6, "static", {friction = 0})
    physics.addBody(wall7, "static", {friction = 0})
    physics.addBody(wall8, "static", {friction = 0})
    physics.addBody(wall9, "static", {friction = 0})
    physics.addBody(meat1, "static", {friction = 0})
    physics.addBody(meat2, "static", {friction = 0})
    physics.addBody(meat3, "static", {friction = 0})
    physics.addBody(meat4, "static", {friction = 0})
    physics.addBody(lion, "dynamic", {friction = 0})
    physics.addBody(sun, "static", {friction = 0})
end

local function RemovePhysicsBodies()

    physics.removeBody(wall1)
    physics.removeBody(wall2)
    physics.removeBody(wall3)
    physics.removeBody(wall4)
    physics.removeBody(wall5)
    physics.removeBody(wall6)
    physics.removeBody(wall7)
    physics.removeBody(wall8)
    physics.removeBody(wall9)
    physics.removeBody(meat1)
    physics.removeBody(meat2)
    physics.removeBody(meat3)
    physics.removeBody(meat4)
    physics.removeBody(lion)
    physics.removeBody(sun)

end

-- Creating Joystick function that determines whether or not joystick is pressed
local function Movement( touch )

    if touch.phase == "began" then

        -- Setting a boolean to true to simulate the holding of a button
        joystickPressed = true

    elseif touch.phase == "ended" then

        -- Setting a boolean to false to simulate the release of a held button
        joystickPressed = false
    end

end --local function Movement( touch )

local function onLocalCollisionwithMeat( self, event )

    if ( event.phase == "began" ) then
        --print( self.myName .. ": collision began with " .. event.other.myName )
        print ("*** lion collision with meat1")
        
    elseif ( event.phase == "ended" ) then
        --print( self.myName .. ": collision ended with " .. event.other.myName )
        print ("*** end of lion collision with meat1")
        composer.gotoScene( "Math", {effect = "flipFadeOutIn", time = 500})

    end

end

local function onLocalCollisionWithSun( self, event )

    if ( event.phase == "began" ) then
        --print( self.myName .. ": collision began with " .. event.other.myName )
        print ("*** lion collision with sun")
        

    elseif ( event.phase == "ended" ) then
        --print( self.myName .. ": collision ended with " .. event.other.myName )
        -- change to lvl2 scene
        print ("*** end of lion collision with sun")
        composer.gotoScene( "main_menu", {effect = "flipFadeOutIn", time = 500})
        restarted = 1
        
    end

end

-- Function for mute button
local function Mute(touch)
    if (touch.phase == "ended") then
        -- pause the sound
        audio.pause(mainMenu)
        -- set the boolean variable to be false
        soundOn = false
        -- hide the mute button
        muteButton.isVisible = false
        -- make the unmute button visible
        unmuteButton.isVisible = true
    end
end

-- Function for unmute button
local function Unmute(touch)
    if (touch.phase == "ended") then
        -- play the sound
        firstScreenChannel = audio.play(firstScreen)
        -- set the boolean variable to be false
        soundOn = true
        -- hide the mute button
        muteButton.isVisible = true
        -- make the unmute button visible
        unmuteButton.isVisible = false
    end
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    meatNumber = 0
    userLives = 3

-----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
-----------------------------------------------------------------------------------------

    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = 100,
        y = 700,

        -- Setting Dimensions
        width = 200,
        height = 100,

        -- Setting Visual Properties
        defaultFile = "Images/Back Button Unpressed.png",
        overFile = "Images/Back Button Pressed.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )

    -- send backButton to the front
        backButton:toFront()

-----------------------------------------------------------------------------------------
-- BACKGROUND AND OBJECTS
-----------------------------------------------------------------------------------------

-- First Wall
    wall1 = display.newRect(0, 0,display.contentWidth, 20)
    wall1.x = display.contentCenterX
    wall1.y = 0
    wall1:setFillColor(0, 0, 0)
    wall1:toFront()

--------------------------------------------------------------------

-- Second Wall
    wall2 = display.newRect(0, 0,display.contentWidth, 20)
    wall2.x = display.contentCenterX
    wall2.y = display.contentHeight
    wall2:setFillColor(0, 0, 0)
    wall2:toFront()

--------------------------------------------------------------------

-- Third Wall
    wall3 = display.newRect(0, 0, 20, display.contentHeight)
    wall3.x = display.contentWidth
    wall3.y = display.contentCenterY
    wall3:setFillColor(0, 0, 0)
    wall3:toFront()

--------------------------------------------------------------------

-- Fourth Wall
    wall4 = display.newRect(0, 0, 20, display.contentHeight)
    wall4.x = 0
    wall4.y = display.contentCenterY
    wall4:setFillColor(0, 0, 0)
    wall4:toFront()

--------------------------------------------------------------------

-- Fifth Wall
    wall5 = display.newRect(0, 0, 10, display.contentHeight - 150)
    wall5.x = 210
    wall5.y = display.contentCenterY - 75
    wall5:setFillColor(0, 0, 0)
    wall5:toFront()

--------------------------------------------------------------------

-- Sixth Wall
    wall6 = display.newRect(0, 0, 10, display.contentHeight - 150)
    wall6.x = 420
    wall6.y = display.contentCenterY + 75
    wall6:setFillColor(0, 0, 0)
    wall6:toFront()

--------------------------------------------------------------------

-- Seventh Wall
    wall7 = display.newRect(0, 0, 10, display.contentHeight - 150)
    wall7.x = 600
    wall7.y = display.contentCenterY - 75
    wall7:setFillColor(0, 0, 0)
    wall7:toFront()

--------------------------------------------------------------------

-- Eighth Wall 
    wall8 = display.newRect(0, 0, 10, display.contentHeight - 281)
    wall8.x = 694 + 99
    wall8.y = display.contentCenterY
    wall8:setFillColor(0, 0, 0)
    wall8:toFront()

--------------------------------------------------------------------

-- Ninth 
    wall9 = display.newRect(0, 0, 198, 10)
    wall9.x = 694
    wall9.y = display.contentCenterY + 238
    wall9:setFillColor(0, 0, 0)
    wall9:toFront()

--------------------------------------------------------------------

-- Creating Joystick
    analogStick = joystick.new( 50, 75 ) 
    analogStick:toFront()

    -- Setting Position
    analogStick.x = 900
    analogStick.y = display.contentHeight - 100

    -- Changing transparency
    analogStick.alpha = 0.5

--------------------------------------------------------------------

-- Creating the first meat
   meat1 = display.newImageRect("Images/meat.png", 420, 470)

   -- position the meat
   meat1.anchorX = 0
   meat1.anchorY = 0
   meat1.x = 30
   meat1.y = 400

   -- scale the lion
   meat1:scale(0.3, 0.3)

--------------------------------------------------------------------

-- Creating the second meat
   meat2 = display.newImageRect("Images/meat.png", 420, 470)

    -- position the meat
   meat2.anchorX = 0
   meat2.anchorY = 0
   meat2.x = 240
   meat2.y = 10

   -- scale the lion
   meat2:scale(0.3, 0.3)   

--------------------------------------------------------------------

-- Creating the third meat
   meat3 = display.newImageRect("Images/meat.png", 420, 470)

    -- position the meat
   meat3.anchorX = 0
   meat3.anchorY = 0
   meat3.x = 440
   meat3.y = 600  

   -- scale the lion
   meat3:scale(0.3, 0.3)

--------------------------------------------------------------------

-- Creating the last meat
   meat4 = display.newImageRect("Images/meat.png", 420, 470)

   -- position the meat
   meat4.anchorX = 0
   meat4.anchorY = 0
   meat4.x = 640
   meat4.y = 10

   -- scale the lion
   meat4:scale(0.3, 0.3)

   -----------------------------------------------------------------

-- Creating the lion character
    lion = display.newImageRect("Images/lion.png", 80, 80)

    -- positioning the lion 
    lion.anchorX = 0
    lion.anchorY = 0 
    lion.x = 60
    lion.y = 20

    -- scale the lion (make it larger)
    lion:scale( 1.5, 1.5 )

------------------------------------------------------------------

-- Creating the sun
   sun = display.newImageRect("Images/Sun.png", 150, 150)

   -- positioning the sun
   sun.anchorX = 0
   sun.anchorY = 0
   sun.x = 620
   sun.y = 450   

-----------------------------------------------------------------
-- COLLISION EVENT LISTENERS
----------------------------------------------------------------

    -- Add collision event listeners
    lion.collision = onLocalCollisionwithMeat
    meat2.collision = onLocalCollisionwithMeat
    meat3.collision = onLocalCollisionwithMeat
    meat4.collision = onLocalCollisionwithMeat
    meat1.collision = onLocalCollisionwithMeat
    sun.collision = onLocalCollisionWithSun

    -- Add Event Listeners
        lion:addEventListener( "collision", lion)
        meat2:addEventListener( "collision", meat2 )
        meat3:addEventListener( "collision", meat3 )
        meat4:addEventListener( "collision", meat4 ) 
        meat1:addEventListener( "collision", meat1 )
        sun:addEventListener( "collision", sun )  
-------------------------------------------------------------------
    
-- Creating the background image
    bkg_image = display.newImageRect("Images/level1_screen.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )  

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

-------------------------------------------------------------------

-- creating mute button
muteButton = display.newImageRect("Images/Mute Button Unpressed.png", 100, 100)
muteButton.x = 960
muteButton.y = 55
muteButton.isVisible = true

-- creating unmute button
unmuteButton = display.newImageRect("Images/Mute Button Pressed.png", 100, 100)
unmuteButton.x = 960
unmuteButton.y = 55
unmuteButton.isVisible = false

-----------------------------------------------------------------------------------------

-- Insert background image into the scene group in order to 
-- ONLY be associated with this scene
    sceneGroup:insert( bkg_image )
    sceneGroup:insert( analogStick )   
    sceneGroup:insert( meat1 ) 
    sceneGroup:insert( meat2 ) 
    sceneGroup:insert( meat3 )
    sceneGroup:insert( meat4 )
    sceneGroup:insert( sun )
    sceneGroup:insert( lion )
    sceneGroup:insert( wall1 )
    sceneGroup:insert( wall2 )
    sceneGroup:insert( wall3 )
    sceneGroup:insert( wall4 )
    sceneGroup:insert( wall5 )
    sceneGroup:insert( wall6 )
    sceneGroup:insert( wall7 )
    sceneGroup:insert( wall8 )
    sceneGroup:insert( wall9 )
    sceneGroup:insert(backButton)
    sceneGroup:insert( muteButton )
    sceneGroup:insert( unmuteButton )
end --function scene:create( event )
-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    ----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        if (restarted == 1) then

            scene:create()
            restarted = 0
        end
        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        -- Play background music
        firstScreenChannel = audio.play(firstScreen)
         -- display the mute button at the start, so it doesn't overlap when it's muted
        muteButton.isVisible = true
        unmuteButton.isVisible = false
        -- lower the volume
        audio.setVolume(0.5, { channel=1, loops=-1 } )
        -- mute button
        muteButton:addEventListener("touch", Mute)
        -- unmute button
        unmuteButton:addEventListener("touch", Unmute)


        if (meatNumber == 1) then
            -- set the x and y position
            meat1.x = -250
            meat1.y = -250
            meat1.collision = offLocalCollision
            meat1:removeEventListener( "collision", meat1 )

        end

        if (meatNumber == 2) then
            -- set the x and y position
            meat2.x = -250
            meat2.y = -250
            meat2.collision = offLocalCollision
            meat2:removeEventListener( "collision", meat2 )

        end

        if (meatNumber == 3) then
            -- set the x and y position
            meat3.x = -250
            meat3.y = -250
            meat3.collision = offLocalCollision
            meat3:removeEventListener( "collision", meat3 )

        end

        if (meatNumber == 4) then
            -- set the x and y position
            meat4.x = -250
            meat4.y = -250
            meat4.collision = offLocalCollision
            meat4:removeEventListener( "collision", meat4 )

        end
     
        -- start the physics engine
        physics.start()
        physics.setGravity( 0, 0 )

        -- activate the joystick
        AddPhysicsBodies()
        analogStick:activate()

        -----------------------------------------------------------------------------------------
        -- EVENT LISTENERS
        -----------------------------------------------------------------------------------------

        -- Listening for the usage of the joystick
        analogStick:addEventListener( "touch", Movement )
        Runtime:addEventListener("enterFrame", RuntimeEvents)

    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    ----------------------------------------------------------------------------------------
    
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        -- STOP THE TIMER OF BACKGROUND MUSIC
        audio.stop(firstScreenChannel)
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.

        -- deactivate the joystick
        analogStick:deactivate()

        -- Stopping the Runtime Events
        Runtime:removeEventListener( "enterFrame", RuntimeEvents )

        -- Removing event listeners
        analogStick:removeEventListener( "touch", Movement )
        lion:removeEventListener( "collision", lion )
        muteButton:removeEventListener( "touch", Mute )
        unmuteButton:removeEventListener( "touch ", Unmute )
        meat1:removeEventListener( "collision ", meat1 )
        RemovePhysicsBodies()

        -- start the physics engine
        physics.stop()

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

end -- function scene:destroy( event )

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
-----------------------------------------------------------------------------------------