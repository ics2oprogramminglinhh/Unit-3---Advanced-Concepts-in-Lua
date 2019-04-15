-----------------------------------------------------------------------------------------
--
-- main_menu.lua
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
sceneName = "main_menu"

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
        bkg:setFillColor(  0.004, 0.537, 1 )

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

        -- Pre-Setting the Transition options
        local transitionOptions_Fade = (
            {
                effect = "fade", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_Fade( )
            composer.gotoScene( "fade Screen", transitionOptions_Fade )
        end

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_CrossFade = (
            {
                effect = "crossFade", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_CrossFade( )
            composer.gotoScene( "crossFade Screen", transitionOptions_CrossFade )
        end    

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_ZoomOutIn = (
            {
                effect = "zoomOutIn", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_ZoomOutIn( )
            composer.gotoScene( "zoomOutIn Screen", transitionOptions_ZoomOutIn )
        end 

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_ZoomOutInFade = (
            {
                effect = "zoomOutInFade", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_ZoomOutInFade( )
            composer.gotoScene( "zoomOutInFade Screen", transitionOptions_ZoomOutInFade )
        end

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_ZoomInOut = (
            {
                effect = "zoomInOut", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_ZoomInOut( )
            composer.gotoScene( "zoomInOut Screen", transitionOptions_ZoomInOut )
        end 
        
        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_ZoomInOutFade = (
            {
                effect = "zoomInOutFade", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_ZoomInOutFade( )
            composer.gotoScene( "zoomInOutFade Screen", transitionOptions_ZoomInOutFade )
        end

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_Flip = (
            {
                effect = "flip", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_Flip( )
            composer.gotoScene( "flip Screen", transitionOptions_Flip )
        end

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_FlipFadeOutIn = (
            {
                effect = "flipFadeOutIn", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_FlipFadeOutIn( )
            composer.gotoScene( "flipFadeOutIn Screen", transitionOptions_FlipFadeOutIn )
        end

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_ZoomOutInRotate = (
            {
                effect = "zoomOutInRotate", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_ZoomOutInRotate( )
            composer.gotoScene( "zoomOutInRotate Screen", transitionOptions_ZoomOutInRotate )
        end 

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_ZoomOutInFadeRotate = (
            {
                effect = "zoomOutInFadeRotate", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_ZoomOutInFadeRotate( )
            composer.gotoScene( "zoomOutInFadeRotate Screen", transitionOptions_ZoomOutInFadeRotate )
        end 

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_ZoomInOutRotate = (
            {
                effect = "zoomInOutRotate", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_ZoomInOutRotate( )
            composer.gotoScene( "zoomInOutRotate Screen", transitionOptions_ZoomInOutRotate )
        end 

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_ZoomInOutFadeRotate = (
            {
                effect = "zoomInOutFadeRotate", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_ZoomInOutFadeRotate( )
            composer.gotoScene( "zoomInOutFadeRotate Screen", transitionOptions_ZoomInOutFadeRotate )
        end 

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_FromRight = (
            {
                effect = "fromRight", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_FromRight( )
            composer.gotoScene( "fromRight Screen", transitionOptions_FromRight )
        end

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_FromLeft = (
            {
                effect = "fromLeft", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_FromLeft( )
            composer.gotoScene( "fromLeft Screen", transitionOptions_FromLeft )
        end 

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_FromTop = (
            {
                effect = "fromTop", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_FromTop( )
            composer.gotoScene( "fromTop Screen", transitionOptions_FromTop )
        end

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_FromBottom = (
            {
                effect = "fromBottom", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_FromBottom( )
            composer.gotoScene( "fromBottom Screen", transitionOptions_FromBottom )
        end

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_SlideLeft = (
            {
                effect = "slideLeft", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_SlideLeft( )
            composer.gotoScene( "slideLeft Screen", transitionOptions_SlideLeft )
        end

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_SlideRight = (
            {
                effect = "slideRight", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_SlideRight( )
            composer.gotoScene( "slideRight Screen", transitionOptions_SlideRight )
        end 

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_SlideDown = (
            {
                effect = "slideDown", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_SlideDown( )
            composer.gotoScene( "slideDown Screen", transitionOptions_SlideDown )
        end 

        -----------------------------------------------------------------------------------------

        -- Pre-Setting the Transition options
        local transitionOptions_SlideUp = (
            {
                effect = "slideUp", -- The animation it's going to use when transitioning
                time = 1000, -- How long the transition will take
            })

        -- The function which transitions to the next screen
        function Transition_SlideUp( )
            composer.gotoScene( "slideUp Screen", transitionOptions_SlideUp )
        end 
        
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Creating Fade Transition button
        local fadeButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentWidth / 3,
                y = display.contentHeight / 8,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 4,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 1, 0.839, 0.004 }, over = { 1, 0.604, 0.004 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Fade", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_Fade -- This function is executed when the touch of the button is Released
            } ) 
        
        -----------------------------------------------------------------------------------------

          -- Creating Cross Fade Transition button
        local crossFadeButton = widget.newButton( 
            {
                -- Setting Position
                x = ( display.contentWidth / 3 ) * 2,
                y = ( display.contentHeight / 8 ),

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 4,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0, 0, 1 }, over = { 0, 0, 0.5 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Cross Fade", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_CrossFade -- This function is executed when the touch of the button is Released
            } ) 
        
        -----------------------------------------------------------------------------------------

          -- Creating Zoom Out-In Transition button
        local zoomOutInButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX / 3,
                y = ( display.contentHeight / 8 ) * 2,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 4,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 1, 0.2, 0.2 }, over = { 0.5, 0.1, 0.1 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Zoom Out In", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_ZoomOutIn -- This function is executed when the touch of the button is Released
            } )

        -----------------------------------------------------------------------------------------

          -- Creating Zoom Out-In Fade Transition button
        local zoomOutInFadeButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX / 3,
                y = ( display.contentHeight / 8 ) * 3,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 3,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 1, 0.6, 0.2 }, over = { 0.5, 0.3, 0.1 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Zoom Out In Fade", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_ZoomOutInFade -- This function is executed when the touch of the button is Released
            } )

        -----------------------------------------------------------------------------------------

          -- Creating Zoom In-Out Transition button
        local zoomInOutButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX / 3,
                y = ( display.contentHeight / 8 ) * 4,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 4,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 1, 1, 0.2 }, over = { 0.5, 0.5, 0.1 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Zoom In Out", -- The text labeled on the button
                labelColor = { default = { 0, 0, 0 }, over = { 0, 0, 0 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_ZoomInOut -- This function is executed when the touch of the button is Released
            } )

        -----------------------------------------------------------------------------------------

          -- Creating Zoom In-Out Fade Transition button
        local zoomInOutFadeButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX / 3,
                y = ( display.contentHeight / 8 ) * 5,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 3,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0.6, 1, 0.2 }, over = { 0.3, 0.5, 0.1 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Zoom In Out Fade", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_ZoomInOutFade -- This function is executed when the touch of the button is Released
            } )

        -----------------------------------------------------------------------------------------

        -- Creating Flip Transition button
        local flipButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX / 3,
                y = ( display.contentHeight / 8 ) * 6,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 4,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0.2, 1, 0.2 }, over = { 0.1, 0.5, 0.1 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Flip", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_Flip -- This function is executed when the touch of the button is Released
            } )

        -----------------------------------------------------------------------------------------

        -- Creating Flip Fade Out In Transition button
        local flipFadeOutInButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX / 3,
                y = ( display.contentHeight / 8 ) * 7,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 3,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0.2, 1, 0.6 }, over = { 0.1, 0.5, 0.3 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Flip Fade Out In", -- The text labeled on the button
                labelColor = { default = {0, 0, 0 }, over = { 0, 0, 0 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_FlipFadeOutIn -- This function is executed when the touch of the button is Released
            } )

        -----------------------------------------------------------------------------------------

          -- Creating Zoom Out-In Rotate Transition button
        local zoomOutInRotateButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX,
                y = ( display.contentHeight / 8 ) * 2,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 3,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0.2, 1, 1 }, over = { 0.1, 0.5, 0.5 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Zoom O-I Rotate", -- The text labeled on the button
                labelColor = { default = { 0, 0, 0 }, over = { 0, 0, 0 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_ZoomOutInRotate -- This function is executed when the touch of the button is Released
            } )

        -----------------------------------------------------------------------------------------

          -- Creating Zoom Out-In Fade Rotate Transition button
        local zoomOutInFadeRotateButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX,
                y = ( display.contentHeight / 8 ) * 3,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 3,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0.2, 0.6, 1 }, over = { 0.1, 0.3, 0.5 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Z O-I Fade Rotate", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_ZoomOutInFadeRotate -- This function is executed when the touch of the button is Released
            } )
        
        -----------------------------------------------------------------------------------------

          -- Creating Zoom In-Out Rotate Transition button
        local zoomInOutRotateButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX,
                y = ( display.contentHeight / 8 ) * 4,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 3,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0.2, 0.2, 1 }, over = { 0.1, 0.1, 0.5 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Zoom I-O Rotate", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_ZoomInOutRotate -- This function is executed when the touch of the button is Released
            } )

        -----------------------------------------------------------------------------------------

          -- Creating Zoom In-Out Fade Rotate Transition button
        local zoomInOutFadeRotateButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX,
                y = ( display.contentHeight / 8 ) * 5,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 3,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0.6, 0.2, 1 }, over = { 0.3, 0.2, 0.5 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Z I-O Fade Rotate", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_ZoomInOutFadeRotate -- This function is executed when the touch of the button is Released
            } )

        -----------------------------------------------------------------------------------------

        -- Creating From Right Transition button
        local fromRightButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX,
                y = ( display.contentHeight / 8 ) * 6,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 4,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 1, 0.2, 1 }, over = { 0.5, 0.1, 0.5 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "From Right", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_FromRight -- This function is executed when the touch of the button is Released
            } )

        -----------------------------------------------------------------------------------------

        -- Creating From Left Transition button
        local fromLeftButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX,
                y = ( display.contentHeight / 8 ) * 7,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 4,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0.6, 0.6, 0.6 }, over = { 0.3, 0.3, 0.3 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "From Left", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_FromLeft -- This function is executed when the touch of the button is Released
            } )

        -----------------------------------------------------------------------------------------

        -- Creating From Top Transition button
        local fromTopButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX * 1.666666,
                y = ( display.contentHeight / 8 ) * 2,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 4,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0.8, 0, 0 }, over = { 0.4, 0, 0 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "From Top", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_FromTop -- This function is executed when the touch of the button is Released
            } )

        -----------------------------------------------------------------------------------------

        -- Creating From Bottom Transition button
        local fromBottomButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX * 1.66666,
                y = ( display.contentHeight / 8 ) * 3,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 4,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0, 0.8, 0 }, over = { 0, 0.4, 0 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "From Bottom", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_FromBottom -- This function is executed when the touch of the button is Released
            } )

        -----------------------------------------------------------------------------------------

        -- Creating Slide Left Transition button
        local slideLeftButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX * 1.66666,
                y = ( display.contentHeight / 8 ) * 4,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 4,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0, 0, 0.8 }, over = { 0, 0, 0.4 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Slide Left", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_SlideLeft -- This function is executed when the touch of the button is Released
            } )
        
        -----------------------------------------------------------------------------------------

        -- Creating Slide Right Transition button
        local slideRightButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX * 1.66666,
                y = ( display.contentHeight / 8 ) * 6,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 4,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 1, 0.5, 0 }, over = { 0.5, 0.25, 0 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Slide Right", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_SlideRight -- This function is executed when the touch of the button is Released
            } )

        -----------------------------------------------------------------------------------------

        -- Creating Slide Down Transition button
        local slideDownButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX * 1.66666,
                y = ( display.contentHeight / 8 ) * 5,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 4,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0.8, 0, 0.8 }, over = { 0.4, 0, 0.4 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Slide Down", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_SlideDown -- This function is executed when the touch of the button is Released
            } )

        -----------------------------------------------------------------------------------------

        -- Creating Slide Up Transition button
        local slideUpButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX * 1.66666,
                y = ( display.contentHeight / 8 ) * 7,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 4,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = {0, 0.6, 0.6 }, over = { 0, 0.3, 0.3 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Slide Up", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = Transition_SlideUp -- This function is executed when the touch of the button is Released
            } )
        -----------------------------------------------------------------------------------------

        -- Inserting objects into the scene group in order to ONLY be associated with this scene
        sceneGroup:insert( fadeButton )
        sceneGroup:insert( crossFadeButton )
        sceneGroup:insert( zoomOutInButton )
        sceneGroup:insert( zoomOutInFadeButton )
        sceneGroup:insert( zoomInOutButton )
        sceneGroup:insert( zoomInOutFadeButton )
        sceneGroup:insert( flipButton )
        sceneGroup:insert( flipFadeOutInButton )
        sceneGroup:insert( zoomOutInRotateButton )
        sceneGroup:insert( zoomOutInFadeRotateButton )
        sceneGroup:insert( zoomInOutRotateButton )
        sceneGroup:insert( zoomInOutFadeRotateButton )
        sceneGroup:insert( fromRightButton )
        sceneGroup:insert( fromLeftButton )
        sceneGroup:insert( fromTopButton )
        sceneGroup:insert( fromBottomButton )
        sceneGroup:insert( slideLeftButton )
        sceneGroup:insert( slideRightButton )
        sceneGroup:insert( slideDownButton )
        sceneGroup:insert( slideUpButton )

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