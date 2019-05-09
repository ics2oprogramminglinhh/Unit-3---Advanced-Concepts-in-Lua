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
sceneName = "level_select"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local level1Button
local level2Button
local level3Button
local backButton

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

-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "level1_screen", {effect = "zoomInOutFade", time = 500})
end    

-----------------------------------------------------------------------------------------

-- Creating Transition Function to Level2 Screen
local function Level2ScreenTransition( )       
    composer.gotoScene( "level2_screen", {effect = "slideRight", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Creating Transition to Level3 Screen
 
 local function Level3ScreenTransition( )
    composer.gotoScene( "level3_screen", {effect = "slideLeft", time = 500})
end  

-- Creating Transition to Level3 Screen
 
 local function Level3ScreenTransition( )
    composer.gotoScene( "level3_screen", {effect = "slideLeft", time = 500})
end  

-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "zoomOutInFade", time = 500})
end

-----------------------------------------------------------------------------------------

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

-----------------------------------------------------------------------------------------

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
muteButton.x = 950
muteButton.y = 50
muteButton.isVisible = true

-- creating unmute button
unmuteButton = display.newImageRect("Images/Mute Button Pressed.png", 100, 100)
unmuteButton.x = 950
unmuteButton.y = 50
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
    display.setDefault("background", 46/255, 139/255, 87/255)

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating level1 Button
    level1Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = 500,

            y = 200,

            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/level1UnpressedLinhH@2x.png",
            overFile = "Images/level1PressedLinhH@2x.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level1ScreenTransition
                      
        } )


    -- Creating level2 Button
    level2Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 500,
            y = 350,

            width = 200,
            height = 100,
            
            -- Insert the images here
            defaultFile = "Images/level2UnpressedLinhH@2x.png",
            overFile = "Images/level2PressedLinhH@2x.png",

            -- When the button is released, call the Credits transition function
            onRelease = Level2ScreenTransition
        } ) 
    
    -- Creating level3 Button

    level3Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 500,
            y = 500,

            width = 200,
            height = 100,

            -- Insert images here
            defaultFile = "Images/level3UnpressedLinhH@2x.png",
            overFile = "Images/level3PressedLinhH@2x.png",

            -- When the button is released, call the Instructions transition function
            onRelease = Level3ScreenTransition
        } ) 

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
        defaultFile = "Images/BackButtonUnpressedLinhH.png",
        overFile = "Images/BackButtonPressedLinhH.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )

    -- send backButton to the front
        backButton:toFront()
    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( level1Button )
    sceneGroup:insert( level2Button )
    sceneGroup:insert( level3Button )
    sceneGroup:insert( muteButton )
    sceneGroup:insert( unmuteButton )
    sceneGroup:insert( backButton )
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
