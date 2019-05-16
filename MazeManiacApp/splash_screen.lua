-----------------------------------------------------------------------------------------
--
-- splash_screen.lua
-- Created by: Linh Ho
-- Date: April 16th. 2019
-- Description: This is the splash screen of the game. It displays the 
-- company logo of Gax Games.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"
-----------------------------------------------------------------------------------------
-- Create Scene Object
local scene = composer.newScene( sceneName )
-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------
-- Global variables
scrollSpeed = 4
runSpeed = 4
----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
    local topLeft = display.newImageRect("Images/topleft.png", 200, 200)
    local topRight = display.newImageRect("Images/topright.png", 200, 200)
    local botLeft = display.newImageRect("Images/botleft.png", 200, 200)
    local botRight = display.newImageRect("Images/botright.png", 200, 200)

---------------------------------------------------------------------------------------
-- SOUNDS
---------------------------------------------------------------------------------------
local whooshSound = audio.loadSound("Sounds/whoosh.mp3")
local whooshChannel
local bkg = audio.loadSound("Sounds/background.mp3")
local bkgChannel
--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that will go to the main menu 
local function gotoMainMenu()
    composer.gotoScene( "main_menu" )
end

local function HideLogo()
    topLeft.isVisible = false
    topRight.isVisible = false
    botLeft.isVisible = false
    botRight.isVisible = false
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be black
    display.setDefault("background", 202/255, 204/255, 206/255)

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( topLeft )
    sceneGroup:insert( topRight )
    sceneGroup:insert( botLeft )
    sceneGroup:insert( botRight )

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- start the splash screen music
        bkgChannel = audio.play(bkg)
        -- lower the volume of the background music
        audio.setVolume(0.5)
        -- whoosh sound
        whooshChannel = audio.play(whooshSound)

    -- set the initial x and y position of topLeft
    topLeft.x = 400
    topLeft.y = -1000

    -- Transitions the topLeft image to the center
    transition.to(topLeft, {x=400, y=300, time=500})

    -- set the initial x and y position of topRight
    topRight.x = 1000
    topRight.y = -1000

    -- Transitions the topRight image to the center
    transition.to(topRight, {x=600, y=300, time=500})

    -- set the initial x and y position of botLeft
    botLeft.x = 400
    botLeft.y = 1000

    -- Transitions the botLeft image to the center
    transition.to(botLeft, {x=400, y=500, time=500})

    -- set the initial x and y position of botRight
    botRight.x = 1000
    botRight.y = 1000

    -- Transitions the botRight image to the center
    transition.to(botRight, {x=600, y=500, time=500})

        -- Go to the main menu screen after the given time.
        timer.performWithDelay (3000, gotoMainMenu)  
        timer.performWithDelay (3000, HideLogo)        
        
    end

end --function scene:show( event )

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
    -- stop the sound channels for this screen
        audio.stop(bkgChannel)
        audio.stop(whooshChannel)
    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
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
