-----------------------------------------------------------------------------------------
--
-- slideUp Screen.lua
-- Transitions Examples
-- Created by Wal Wal
-- Started November 14
--
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Calling Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Calling Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "slideUp Screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- FORWARD REFERENCES
-----------------------------------------------------------------------------------------

local bkg

-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Creating the background
    bkg = display.newRect( 0, 0, 0, 0 ) -- They're set to 0 so they can be clearly set below

        -- Setting position
        bkg.x = display.contentCenterX
        bkg.y = display.contentCenterY 

        -- Setting dimensions
        bkg.width = display.contentWidth
        bkg.height = display.contentHeight

        -- Setting color
        bkg:setFillColor( 0, 0.6, 0.6 )

        -- Sending to Back Layer
        bkg:toBack( )

    -----------------------------------------------------------------------------------------

    -- Inserting objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg )

    end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
       
        -- Pre-Setting Transition Options
        local transitionOptions = (
            {
                effect = "slideUp",
                time = 1000
            })

        -- Creating Transition function
        function Transition( )
            composer.gotoScene( "main_menu", transitionOptions )
        end

    -----------------------------------------------------------------------------------------

        -- Creating "Back" button
        local mainMenuButton = widget.newButton(
            {
                -- Setting Position
                x = display.contentCenterX,
                y = display.contentCenterY ,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 2,
                height = 100,
                cornerRadius = 50,
                strokeWidth = 20,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0.004, 0.537, 1 }, over = { 1, 0.604, 0.004 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Main Menu",
                labelColor = { default = { 0, 0, 0 }, over = { 0, 0, 0 } },
                font = Arial,
                fontSize = 60,
                
                -- Button Functions
                onRelease = Transition
            } )

    -----------------------------------------------------------------------------------------

    -- Inserting objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( mainMenuButton )



    elseif ( phase == "did" ) then

    end

end

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

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end

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