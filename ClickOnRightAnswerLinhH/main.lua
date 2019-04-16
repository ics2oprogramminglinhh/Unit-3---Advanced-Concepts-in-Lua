-----------------------------------------------------------------------------------------
-- main.lua
-- Created by: Gil Robern
-- Modified by: Linh Ho
-- Date: April 16th, 2019
-- Description: This calls the splash screen of the app to load itself.
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
display.setStatusBar( display.HiddenStatusBar )

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

composer.gotoScene( "level1_screen" )