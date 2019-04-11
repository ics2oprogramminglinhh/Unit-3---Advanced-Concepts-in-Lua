-----------------------------------------------------------------------------------------
-- Title: SampleVideoGame
-- Name: Linh Ho
-- Course: ICS2O
-- Date: February 13, 2019
-- This program calls the splash screen of the app to load itself.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen
composer.gotoScene( "splash_screen" )
