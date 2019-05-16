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

-- Load Physics
local physics = require( "physics" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
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
    composer.gotoScene( "level_select", {effect = "zoomInOutFade", time = 500})
end

