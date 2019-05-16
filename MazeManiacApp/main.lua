-----------------------------------------------------------------------------------------
--
-- main.lua
-- Created by: Linh Ho
-- Date: May 16, 2019
-- Description: This calls the splash screen of the app to load itself.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen
composer.gotoScene( "level1_screen" )
