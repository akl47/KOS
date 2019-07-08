
function hoverslam {
    runPath("0:/functions/getStageHeight.ks").
    hudtext("Stage 1: Running Hoverslam", 5, 2, 50, white, false).
    set throttle to 0.  
    
    lock g to constant:g * body:mass / body:radius^2.
    lock pos0 to getStageHeight()+5. 
    lock pos to alt:radar - pos0.
    LOCK velVec TO SHIP:velocity:surface.
    lock maxDeceleration to (ship:availableThrustat(1)/ship:mass) - g.
    lock stopDist to (velVec:mag)^2 / (1.5 * maxDeceleration).
    set shipStatus to "falling".

    function displayStats {
        //print "Stage: " + stage:number at (0,0).
        print "Status: " + shipStatus at (0,0).
        print "Pos0: " + round(pos0,2) at (20,0).
        print "Stop: " + round(stopDist,2) at (0,1).
        print "Pos: " + round(pos,2) at (20,1).
        print "Speed: " + round(velVec:MAG,2) at (0,2).
        print "Speed X: " + round(velVec:X,2) at (0,3).
        print "Speed Y: " + round(velVec:Y,2) at (0,4).
        print "Speed Z: " + round(velVec:Z,2) at (0,5).
        print "diff: " + round(pos - stopDist,2) at (20,2).
    }

    until false {
        displayStats().
        if(shipStatus="falling") {
            sas off.
            rcs on.
            brakes on.
            gear on.
            LOCK STEERING TO LOOKDIRUP(srfRetrograde:VECTOR,FACING:UPVECTOR).
            if(pos < stopDist) {
               
                set shipStatus to "landing".
            }
        }
        if(shipStatus = "landing") {
            lock throttle to stopDist / pos.
            if(velVec:Z > -6) {
                set shipStatus to "landed".
            }
        }
        if(shipStatus = "landed") {
            lock throttle to 0.
            lock steering to up.
            rcs off.
            hudtext("Stage 1:Welcome to " + body:name, 5, 2, 50, white, false).
        }
    }

    // TODO kill horizontal velocity first. Aim 120% outside of retrograde vector until within 1 degree
   
}