extends Area

var x = 0
var z = 0
var rng = RandomNumberGenerator.new()

func _ready():
	for _i in range(0,3):
		#loadCar($PositionLeft.translation+global_transform.origin)
		#loadCar($PositionRight.translation+global_transform.origin)
		get_parent().spawnCar($PositionLeft.translation+global_transform.origin,true)
		get_parent().spawnCar($PositionRight.translation+global_transform.origin,false)
		$PositionLeft.translation.z -= 6
		$PositionRight.translation.z -= 6
		
onready var human = load("res://Cars/Human.tscn")

func fuessgaenger():
	rng.randomize()
	var number = rng.randi_range(0,3)
	if number==1:
		get_parent().spawnHuman($FussgaengerLeft.translation+global_transform.origin,false)
	if number ==2:
		get_parent().spawnHuman($FussgaengerRight.translation+global_transform.origin,true)
