extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var move = false
var back = false
var distance = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Peasant")
	

func beGone():
	move=true
	
func comeBack():
	back=true
	
func _physics_process(_delta):
	if move:
		var _erg=move_and_slide(Vector3(0,4,0),Vector3.UP)
		distance -=1
		if distance <=0:
			move=false
			distance = 100
	if back:
		var _erg=move_and_slide(Vector3(0,-4,0),Vector3.UP)
		distance -=1
		if distance <=0:
			back=false
			distance = 100
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
