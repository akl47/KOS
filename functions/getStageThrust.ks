function getStageThrust {
    parameter stageNumber.
    list engines in e.
    set stageThrust to 0.
    for e in e{
        if e:stage = stageNumber  {
            set stageThrust to stageThrust + e:availableThrust.
        }
    }
    return stageThrust.
}