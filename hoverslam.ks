clearscreen.
set throttle to 0.
sas off.
LOCK STEERING TO LOOKDIRUP(srfRetrograde:VECTOR,FACING:UPVECTOR).
lock g to constant:g * body:mass / body:radius^2.
set pos0 to 10.849. // TODO make this the stage height
lock pos to alt:radar - pos0.
LOCK velVec TO SHIP:velocity:surface.
lock maxDeceleration to (ship:availableThrust/ship:mass) - g.
lock stopDist to (velVec:mag)^2 / (2 * maxDeceleration).

 UNTIL pos < stopDist {
  PRINT "Position: " + ROUND(pos,5) AT (0,1).
  PRINT "Stop Dist: " + ROUND(stopDist,0) AT (0,2).
 }
WAIT UNTIL pos < stopDist.
	hudtext("Trying to land on " + body:name, 5, 2, 50, white, false).
    PRINT "Position: " + ROUND(pos,5) AT (0,1).
    PRINT "Stop Dist: " + ROUND(stopDist,0) AT (0,2).
	lock throttle to stopDist / pos.

WAIT UNTIL ship:verticalspeed > -0.01.
	hudtext("Welcome to " + body:name, 5, 2, 50, white, false).
   	lock throttle to 0.


core:part:getmodule("kOSProcessor"):doevent("Close Terminal").