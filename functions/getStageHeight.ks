FUNCTION getStageHeight
{
  LOCAL rh IS 0.
  LOCAL pl IS LIST().
  LIST PARTS IN pl.
  FOR p IN pl {
    LOCAL p_pos IS p:POSITION - SHIP:ROOTPART:POSITION.
    LOCAL ph IS VDOT(-FACING:VECTOR,p_pos).
    SET rh TO MAX(ph, rh).
  }
  RETURN rh.
}