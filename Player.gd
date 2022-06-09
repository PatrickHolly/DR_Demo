extends KinematicBody

var speed=0

var velocity = Vector3.ZERO
var direction = Vector3(0,0,1)

var t=0

onready var timeleft=301*60
var distance = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Player")
	pass # Replace with function body.

func _physics_process(_delta):
	getInput()
	distance+=speed
	var _erg=move_and_slide(direction*speed,Vector3.UP)
	
func _process(_delta):
	if(running):
		timeleft-=1;
	var seconds = str((timeleft/60)%60)
	if(seconds.length()==1):
		seconds = "0"+seconds
	
	$Control/Label.text= "Time left: "+str((timeleft/60)/60)+":"+seconds
	if(timeleft==0):
		$Control2.visible=true
		$Control2.setDistance(distance)
		$Control2.gameOver()
		

func getInput():
	if Input.is_action_pressed("faster"):
		speed-=0.05
		if(speed<-10):
			speed=-10
	if Input.is_action_pressed("slower"):
		speed+=0.1
		if(speed>0):
			speed=0

var running=true;
func _on_Area_body_entered(body):
	if(body!=self):
		running=false
		$CollisionEnd.visible=true
		$CollisionEnd.setDistance(distance)
		$CollisionEnd.setTime(timeleft)
		$CollisionEnd.startAnim()
	pass # Replace with function body.
