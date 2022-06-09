extends Spatial

var rng = RandomNumberGenerator.new()
enum States {ROT,GRUEN}
var changestate
var toRed = false
var toGreen = false
var yellowTimer=0
var state = States.ROT
func _ready():
	$Rot.visible=true
	$Gelb.visible=false
	$Gruen.visible=false
	rng.randomize()
	changestate = rng.randi_range(210,1500)


func to_Red():
	$Rot.visible=false
	$Gelb.visible=true
	$Gruen.visible=false
	yellowTimer=210
	toRed = true


func to_Green():
	$Rot.visible=false
	$Gelb.visible=true
	$Gruen.visible=false
	yellowTimer=120
	toGreen = true
	
func _process(_delta):
	changestate-=1
	if(changestate<=0):
		changestate = rng.randi_range(210,1500)
		match state:
			States.ROT:
				state=States.GRUEN
				to_Green()
				$Object.beGone()
				$Object2.comeBack()
			States.GRUEN:
				state=States.ROT
				to_Red()
				$Object.comeBack()
				$Object2.beGone()
	if(toRed):
		yellowTimer-=1;
		if(yellowTimer==0):
			$Rot.visible=true
			$Gelb.visible=false
			toRed=false
	if(toGreen):
		yellowTimer-=1;
		if(yellowTimer==0):
			$Gruen.visible=true
			$Gelb.visible=false
			toGreen=false
	
	
