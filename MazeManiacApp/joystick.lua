-----------------------------------------------------------------------------------------
--
-- a simple Lua/Corona joystick module based on Rob Miracle's code:
-- http://forums.coronalabs.com/topic/32941-virtual-joystick-module-for-games/
-- simplified some of the code, removing some nice-ities, but it still works
--
-----------------------------------------------------------------------------------------

local Joystick = {}

-----------------------------------------------------------------------------------------

function Joystick.new( innerRadius, outerRadius )

    local stage = display.getCurrentStage()
    
    local joyGroup = display.newGroup()

    -----------------------------------------------------------------------------------------
    
    local bgJoystick = display.newCircle( joyGroup, 0,0, outerRadius )
    bgJoystick:setFillColor( .2,.2,.2 )
    
    -----------------------------------------------------------------------------------------

    local radToDeg = 180/math.pi
    local degToRad = math.pi/180

    -----------------------------------------------------------------------------------------

    local joystick = display.newCircle( joyGroup, 0,0, innerRadius )
    joystick:setFillColor( .8,.8,.8 )

    -----------------------------------------------------------------------------------------

    -- for easy reference later:
    joyGroup.joystick = joystick
    
    -----------------------------------------------------------------------------------------

    -- where should joystick motion be stopped?
    local stopRadius = outerRadius - innerRadius / 10
    
    -----------------------------------------------------------------------------------------

    -- return a direction identifier, angle, distance
    local directionId = 0
    local angle = 0
    local distance = 0

    -----------------------------------------------------------------------------------------

    -- Creating a function which can be called to get the direction value
    function joyGroup.getDirection()
    	return directionId
    end

    -----------------------------------------------------------------------------------------

    -- Creating a function which can be called to get the anlge in degrees
    function joyGroup:getAngle()
    	return angle
    end

    -----------------------------------------------------------------------------------------

    -- Creating a function which can be called to get the value of the distance from the center of the joystick
    function joyGroup:getDistance()
    	return distance/stopRadius
    end
    
    -----------------------------------------------------------------------------------------

    -- Creating a function which allows you to apply the joysick to an object
    function joyGroup:move( object, power )
        power = power * 0.1

        if direction == 2 then
            object.x = object.x + ( power * distance )
            object.y = object.y - ( power * distance )

        elseif direction == 3 then
            object.y = object.y - ( power * distance )

        elseif direction == 4 then
            object.x = object.x - ( power * distance )
            object.y = object.y - ( power * distance )

        elseif direction == 5 then
            object.x = object.x - ( power * distance )

        elseif direction == 6 then
            object.x = object.x - ( power * distance )
            object.y = object.y + ( power * distance )

        elseif direction == 7 then
            object.y = object.y + ( power * distance )

        elseif direction == 8 then
            object.x = object.x + ( power * distance )
            object.y = object.y + ( power * distance )

        else      
            object.x = object.x + ( power * distance )

        end      
    end
    
    -----------------------------------------------------------------------------------------

    -- Creating a function which allows you to apply the joysick to an object
    function joyGroup:moveGroup( parent, power )
        power = power * 0.1
        
        if direction == 2 then
            parent.x = parent.x + ( power * distance )
            parent.y = parent.y - ( power * distance )

        elseif direction == 3 then
            parent.y = parent.y - ( power * distance )

        elseif direction == 4 then
            parent.x = parent.x - ( power * distance )
            parent.y = parent.y - ( power * distance )

        elseif direction == 5 then
            parent.x = parent.x - ( power * distance )

        elseif direction == 6 then
            parent.x = parent.x - ( power * distance )
            parent.y = parent.y + ( power * distance )

        elseif direction == 7 then
            parent.y = parent.y + ( power * distance )

        elseif direction == 8 then
            parent.x = parent.x + ( power * distance )
            parent.y = parent.y + ( power * distance )

        else
            parent.x = parent.x + ( power * distance )

        end      
    end

    -----------------------------------------------------------------------------------------
  
    function joystick:touch(event)

        local phase = event.phase

        -----------------------------------------------------------------------------------------

        if( (phase=='began') or (phase=="moved") ) then

        	if( phase == 'began' ) then
                stage:setFocus(event.target, event.id)
            end

            -----------------------------------------------------------------------------------------

            local parent = self.parent

            -----------------------------------------------------------------------------------------

            local posX, posY = parent:contentToLocal(event.x, event.y)
            angle = (math.atan2( posX, posY )*radToDeg)-90

            -----------------------------------------------------------------------------------------

            if( angle < 0 ) then
            	angle = 360 + angle
            end

            -----------------------------------------------------------------------------------------

			-- Creating different axis
            if( (angle>=22.5) and (angle<67.5) ) then
                directionId = 2
            elseif( (angle>=67.5) and (angle<112.5) ) then
                directionId = 3
            elseif( (angle>=112.5) and (angle<157.5) ) then
                directionId = 4
            elseif( (angle>=157.5) and (angle<202.5) ) then
                directionId = 5
            elseif( (angle>=202.5) and (angle<247.5) ) then
                directionId = 6
            elseif( (angle>=247.5) and (angle<292.5) ) then
                directionId = 7
            elseif( (angle>=292.5) and (angle<337.5) ) then
                directionId = 8
            else
                directionId = 1
            end
			
            -----------------------------------------------------------------------------------------

			-- could emit "direction" events here
			--Runtime:dispatchEvent( {name='direction',directionId=directionId } )
            
            -----------------------------------------------------------------------------------------

            distance = math.sqrt((posX*posX)+(posY*posY))
            
            if( distance >= stopRadius ) then
                distance = stopRadius
                local radAngle = angle*degToRad
                self.x = distance*math.cos(radAngle)
                self.y = -distance*math.sin(radAngle)
            else
                self.x = posX
                self.y = posY
            end
            
        -----------------------------------------------------------------------------------------

        else
            self.x = 0
            self.y = 0
            stage:setFocus(nil, event.id)
            
            directionId = 0
            angle = 0
            distance = 0
        end

        -----------------------------------------------------------------------------------------

        return true

    end
    
    -----------------------------------------------------------------------------------------

    function joyGroup:activate()
        self:addEventListener("touch", self.joystick )
        self.directionId = 0
        self.angle = 0
        self.distance = 0
    end

    -----------------------------------------------------------------------------------------

    function joyGroup:deactivate()
        self:removeEventListener("touch", self.joystick )
        self.directionId = 0
        self.angle = 0
        self.distance = 0
    end

    -----------------------------------------------------------------------------------------

    return( joyGroup )

end

return Joystick

-----------------------------------------------------------------------------------------

-- sample main.lua code:
--local jslib = require( "simpleJoystick" )
--
--local js = jslib.new( 100, 200 )
--js.x = display.contentWidth/2
--js.y = display.contentHeight/2
--
--function catchTimer( e )
--	print( "  joystick info: "
--		.. " dir=" .. js:getDirection()
--		.. " angle=" .. js:getAngle()
--		.. " dist="..js:getDistance() )
--	return true
--end
--
--js:activate()
--timer.performWithDelay( 500, catchTimer, -1 )
