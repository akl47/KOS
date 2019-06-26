clearscreen.
lock g to constant:g * body:mass / body:radius^2.
list parts in myParts.
set stageMass to 0.
set stageNumber to 1.
for p in myParts {
	if p:stage = stageNumber {
		set stageMass to stageMass + p:mass.
	}
}
print "Stage " + stageNumber + " Mass: " + stageMass.