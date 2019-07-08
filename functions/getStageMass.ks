function getStageMass {
    parameter stageNumber.
    list parts in p.
    set stageMass to 0.
    for p in p {
        if p:stage >= stageNumber - 1  {
            set stageMass to stageMass + p:mass.
        }
    }

    return stageMass.
}

print "GetStageMass Loaded".