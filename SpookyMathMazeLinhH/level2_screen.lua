-------------------------------------------------------------------------------------------
-- Level 2
-- Date: Jan.19 2016
-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )
local joystick = require( "joystick" )
local physics = require("physics") 


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- DECLARATION LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
pumpkinNumber = 0
userLives = 3
lvNumber = 2
local bkg_image
local analogStick
local facingWhichDirection = "right"
local joystickPressed = false

-----------------------------------------------------------------------------------------
-- L0CAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating a function which limits the characters' movement to the visible screen

local function ScreenLimit( character )   

    -- Checking if the the character is about to go off the right side of the screen
    if character.x > ( display.contentWidth - character.width / 2 ) then
            
        character.x = character.x - 7.5

    -- Checking if the character is about to go off the left side of the screen
    elseif character.x < ( character.width / 2 ) then

        character.x = character.x + 7.5

    -----------------------------------------------------------------------------------------

    -- Checking if the character is about to go off the bottom of the screen
    elseif character.y > ( display.contentHeight - character.height / 2 ) then

        character.y = character.y - 7.5

    -- Checking if the character is about to off the top of the screen
    elseif character.y < ( character.height / 2 ) then

        character.y = character.y + 7.5

    end
end
 
local function RuntimeEvents( )

        -- Retrieving the properties of the joystick
        angle = analogStick:getAngle()
        distance = analogStick:getDistance() -- Distance from the center of the joystick background
        direction = analogStick.getDirection()

        -----------------------------------------------------------------------------------------

        -- Checking if the joystick is being held
        if joystickPressed == true then

            -- Applying the force of the joystick to move the flower
            analogStick:move( flower, 0.75 )

        end

        -----------------------------------------------------------------------------------------

        -- Limiting each character's movement to the edge of the screen
        ScreenLimit( flower )

        -----------------------------------------------------------------------------------------

        -- Checking if the joystick is pointing the opposite direction of the character
        if facingWhichDirection == "left" then
            
            -- Checking if the joystick is pointing to the right
            if direction == 1 or direction == 2 or direction == 8 then

                -- Flipping the controlled charcter's direction
                --flower:scale( -1, 1 )

                -- Setting the status of the character's directions
                facingWhichDirection = "right"

            end
        end

        -----------------------------------------------------------------------------------------

        -- Checking if the joystick is pointing the opposite direction of the character
        if facingWhichDirection == "right" then


            -- Checking if the joystick is pointing to the right
            if direction == 4 or direction == 5 or direction == 6 then

                -- Flipping the controlled charcter's direction
                --flower:scale( -1, 1 )

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
    physics.addBody(wall10, "static", {friction = 0})
    physics.addBody(pumpkin1, "static", {friction = 0})
    physics.addBody(pumpkin2, "static", {friction = 0})
    physics.addBody(pumpkin3, "static", {friction = 0})
    physics.addBody(pumpkin4, "static", {friction = 0})
    physics.addBody(flower, "dynamic", {friction = 0})
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
    physics.removeBody(wall10)


    physics.removeBody(pumpkin1)
    physics.removeBody(pumpkin2)
    physics.removeBody(pumpkin3)
    physics.removeBody(pumpkin4)
    physics.removeBody(flower)
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
-----------------------------------------------------------------------------------------



local function onLocalCollision( self, event )

    if ( event.phase == "began" ) then
        --print( self.myName .. ": collision began with " .. event.other.myName )
        print ("*** flower collision with pumpkin1")
        

    elseif ( event.phase == "ended" ) then
        --print( self.myName .. ": collision ended with " .. event.other.myName )
        print ("*** end of flower collision with pumpkin1")
        composer.gotoScene( "Math2", {effect = "flipFadeOutIn", time = 500})
        
    end
end

local function onLocalCollisionWithSun( self, event )

    if ( event.phase == "began" ) then
        --print( self.myName .. ": collision began with " .. event.other.myName )
        print ("*** flower collision with sun")
        

    elseif ( event.phase == "ended" ) then
        --print( self.myName .. ": collision ended with " .. event.other.myName )
        print ("*** end of flower collision with sun")
        composer.gotoScene( "you_Win", {effect = "flipFadeOutIn", time = 500})
        
    end
end
    -- Creating a group that associates objects with the scene



-- The function called when the screen doesn't exist
function scene:create( event )

    local sceneGroup = self.view
    pumpkinNumber = 0
    userLives = 3
    -----------------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImageRect("Images/level1.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth

    bkg_image.height = display.contentHeight

    -- Walls
    wall1 = display.newRect(0, 0,display.contentWidth, 20)
    wall1.x = display.contentCenterX
    wall1.y = 0
    wall1:setFillColor(0, 0, 0)
    wall1:toFront()
    

    wall2 = display.newRect(0, 0,display.contentWidth, 10)
    wall2.x = display.contentCenterX
    wall2.y = display.contentHeight
    wall2:setFillColor(0, 0, 0)
    wall2:toFront()
    

    wall3 = display.newRect(0, 0, 10, display.contentHeight)
    wall3.x = display.contentWidth
    wall3.y = display.contentCenterY
    wall3:setFillColor(0, 0, 0)
    wall3:toFront()
    

    wall4 = display.newRect(0, 0, 10, display.contentHeight)
    wall4.x = 0
    wall4.y = display.contentCenterY
    wall4:setFillColor(0, 0, 0)
    wall4:toFront()
    

    wall5 = display.newRect(0, 0, 10, display.contentHeight - 150)
    wall5.x = 210
    wall5.y = display.contentCenterY - 75
    wall5:setFillColor(0, 0, 0)
    wall5:toFront()
    
--Yellow
    wall6 = display.newRect(0, 0, 10, display.contentHeight - 850)
    wall6.x = 420
    wall6.y = display.contentCenterY - 375
    wall6:setFillColor(0, 0, 0)
    wall6:toFront()
--Orange
    wall7 = display.newRect(0, 0, 10, display.contentHeight - 150 )
    wall7.x = 420
    wall7.y = display.contentCenterY + 108
    wall7:setFillColor(0, 0, 0)
    wall7:toFront()
    
--Red
    wall8 = display.newRect(0, 0, 10, display.contentHeight - 150)
    wall8.x = 600
    wall8.y = display.contentCenterY - 75
    wall8:setFillColor(0, 0, 0)
    wall8:toFront()
    
--Black
    wall9 = display.newRect(0, 0, 10, display.contentHeight - 281)
    wall9.x = 694 + 99
    wall9.y = display.contentCenterY
    wall9:setFillColor(0, 0, 0)
    wall9:toFront()
    
--Purple
    wall10 = display.newRect(0, 0, 198, 10)
    wall10.x = 694
    wall10.y = display.contentCenterY + 238
    wall10:setFillColor(0, 0, 0)
    wall10:toFront()
    


    --Creating the pumpkins.

    -- Creating Joystick
    analogStick = joystick.new( 50, 75 ) 

    -- Setting Position
    analogStick.x = 125
    analogStick.y = display.contentHeight - 125

    -- Changing transparency
    analogStick.alpha = 0.5


   pumpkin1 = display.newImageRect("Images/LevelPumpkin.png", 178, 148)
   pumpkin1.anchorX = 0
   pumpkin1.anchorY = 0
   pumpkin1.x = 210
   pumpkin1.y = 600
   

   pumpkin2 = display.newImageRect("Images/LevelPumpkin.png", 178, 148)
   pumpkin2.anchorX = 0
   pumpkin2.anchorY = 0
   pumpkin2.x = 410
   pumpkin2.y = 23   
   

   pumpkin3 = display.newImageRect("Images/LevelPumpkin.png", 178, 148)
   pumpkin3.anchorX = 0
   pumpkin3.anchorY = 0
   pumpkin3.x = 820
   pumpkin3.y = 600  
   

   pumpkin4 = display.newImageRect("Images/LevelPumpkin.png", 178, 148)
   pumpkin4.anchorX = 0
   pumpkin4.anchorY = 0
   pumpkin4.x = 820
   pumpkin4.y = 8 

-----------------------------------------------------------------
--Adding in the character.

    flower = display.newImageRect("Images/Characters.png", 80, 80)
    flower.anchorX = 0
    flower.anchorY = 0 
    flower.x = 60
    flower.y = 20
    

-----------------------------------------------------------------
-- Adding in the sun.

   sun = display.newImageRect("Images/Sun.png", 150, 150)
   sun.anchorX = 0
   sun.anchorY = 0
   sun.x = 620
   sun.y = 450   

    -- add collision event listeners
    flower.collision = onLocalCollision
    flower:addEventListener( "collision", flower)

    pumpkin2.collision = onLocalCollision
    pumpkin2:addEventListener( "collision", pumpkin2 ) 

    pumpkin3.collision = onLocalCollision
    pumpkin3:addEventListener( "collision", pumpkin3 )

    pumpkin4.collision = onLocalCollision
    pumpkin4:addEventListener( "collision", pumpkin4 ) 

    pumpkin1.collision = onLocalCollision
    pumpkin1:addEventListener( "collision", pumpkin1 )

    sun.collision = onLocalCollisionWithSun
    sun:addEventListener( "collision", sun )  

    
    -- Send the background image to the back layer so all other objects can be on top
    

        -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )
    sceneGroup:insert( analogStick )   
    sceneGroup:insert( pumpkin1 ) 
    sceneGroup:insert( pumpkin2 ) 
    sceneGroup:insert( pumpkin3 )
    sceneGroup:insert( pumpkin4 )
    sceneGroup:insert( sun )
    sceneGroup:insert( flower )
    sceneGroup:insert( wall1 )
    sceneGroup:insert( wall2 )
    sceneGroup:insert( wall3 )
    sceneGroup:insert( wall4 )
    sceneGroup:insert( wall5 )
    sceneGroup:insert( wall6 )
    sceneGroup:insert( wall7 )
    sceneGroup:insert( wall8 )
    sceneGroup:insert( wall9 )
    sceneGroup:insert( wall10 )

end --function scene:create( event )
-----------------------------------------------------------------


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------
--This function causes the pumpkins to move up then down.
-- Function to move top
--function movePumpkin1 ()
  --  timer.performWithDelay(800, movePumkin1Down) 
    --pumpkin1.y = pumpkin1.y - 2    
--end
  
--function movePumkin1Down()
  -- pumpkin1.y = pumpkin1.y + 2
--end   



-----------------------------------------------------------------------------------------------
-- The function called when the scene is issued to appear on screen
function scene:show( event )

    local sceneGroup = self.view
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

        if (pumpkinNumber == 1) then

            pumpkin1.x = -250
            pumpkin1.y = -250
            pumpkin1.collision = offLocalCollision
            pumpkin1:removeEventListener( "collision", pumpkin1 )

        end

        if (pumpkinNumber == 2) then

            pumpkin2.x = -250
            pumpkin2.y = -250
            pumpkin2.collision = offLocalCollision
            pumpkin2:removeEventListener( "collision", pumpkin2 )

        end

        if (pumpkinNumber == 3) then

            pumpkin3.x = -250
            pumpkin3.y = -250
            pumpkin3.collision = offLocalCollision
            pumpkin3:removeEventListener( "collision", pumpkin3 )

        end

        if (pumpkinNumber == 4) then

            pumpkin4.x = -250
            pumpkin4.y = -250
            pumpkin4.collision = offLocalCollision
            pumpkin4:removeEventListener( "collision", pumpkin4 )

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

end  --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase


    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.


        


    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.

                -- Deactivating the Analog Stick
        analogStick:deactivate()

        -- Stopping the Runtime Events
        Runtime:removeEventListener( "enterFrame", RuntimeEvents )

        -- Removing the listener which listens for the usage of the joystick
        analogStick:removeEventListener( "touch", Movement )

        flower:removeEventListener( "collision", flower)
        pumpkin1:removeEventListener( "collision", pumpkin1 )
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

--Runtime:addEventListener("enterFrame", CheckCollisions)
 --Runtime:addEventListener("enterFrame",  movePumpkin1 )




-----------------------------------------------------------------------------------------

return scene

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------