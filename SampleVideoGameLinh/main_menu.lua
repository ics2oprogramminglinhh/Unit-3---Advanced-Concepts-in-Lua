-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
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
sceneName = "main_menu"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local playButton
local creditsButton
local instructionsButton

local muteButton
local unmuteButton
------------------------------------------------------------------------------------------
-- SOUNDS
------------------------------------------------------------------------------------------

-- background music 
local mainMenu = audio.loadSound("Sounds/bkgMusic.mp3")
local mainMenuChannel


local click = audio.loadSound("Sounds/clickSound.mp3")
local clickChannel

-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------

-- set the boolean variable to be true
soundOn = true

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "slideRight", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "level1_screen", {effect = "zoomInOutFade", time = 500})
end    

-----------------------------------------------------------------------------------------

-- Creating Transition to Instructions Page
 
 local function InstructionsTransition( )
    composer.gotoScene( "instructions_screen", {effect = "slideLeft", time = 500})
end  

-- Creating Transition to Level Select Page
 
 local function LevelSelectTransition( )
    composer.gotoScene( "level_select", {effect = "zoomInOutFade", time = 500})
end  

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

local function Unmute(touch)
    if (touch.phase == "ended") then
        -- play the sound
        mainMenuChannel = audio.play(mainMenu)
        -- set the boolean variable to be false
        soundOn = true
        -- hide the mute button
        muteButton.isVisible = true
        -- make the unmute button visible
        unmuteButton.isVisible = false
    end
end
------------------------------------------------------------------------------------------
-- OBJECTS
------------------------------------------------------------------------------------------
-- creating mute button
muteButton = display.newImageRect("Images/Mute Button Unpressed.png", 100, 100)
muteButton.x = 300
muteButton.y = 700
muteButton.isVisible = true

-- creating unmute button
unmuteButton = display.newImageRect("Images/Mute Button Pressed.png", 100, 100)
unmuteButton.x = 300
unmuteButton.y = 700
unmuteButton.isVisible = false
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/main_menu.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight


    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = 120,

            y = 460,

            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/Start Button Unpressed.png",
            overFile = "Images/Start Button Pressed.png",

            -- When the button is released, call the Level Select transition function
            onRelease = LevelSelectTransition
                      
        } )

    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 120,
            y = 700,

            width = 200,
            height = 100,
            
            -- Insert the images here
            defaultFile = "Images/Credits Button Unpressed.png",
            overFile = "Images/Credits Button Pressed.png",

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 
    
    -- Creating Instructions Button

    instructionsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 120,
            y = 580,

            width = 200,
            height = 100,

            -- Insert images here
            defaultFile = "Images/Instructions Button Unpressed.png",
            overFile = "Images/Instructions Button Pressed.png",

            -- When the button is released, call the Instructions transition function
            onRelease = InstructionsTransition
        } ) 

    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( playButton )
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( instructionsButton )
    sceneGroup:insert( muteButton )
    sceneGroup:insert( unmuteButton )
    
end -- function scene:create( event )   

-----------------------------------------------------------------------------------------

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

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then       
        -- Play the background music for this scene
        mainMenuChannel = audio.play(mainMenu)
        -- display the mute button at the start, so it doesn't overlap when it's muted
        muteButton.isVisible = true
        unmuteButton.isVisible = false
        -- lower the volume
        audio.setVolume(0.5, { channel=1, loops=-1 } )
        -- mute button
        muteButton:addEventListener("touch", Mute)
        -- unmute button
        unmuteButton:addEventListener("touch", Unmute)
    end
end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
            --stop the mainMenu music
            audio.stop(mainMenuChannel)

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        -- remove event listener from mute and unmute button
            muteButton:removeEventListener("touch", Mute)
            unmuteButton:removeEventListener("touch", Unmute)
    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

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
