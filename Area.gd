extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var isvisible=true

onready var car = load("res://Car.tscn")
onready var gerade = load("res://Areas/Gerade.tscn")
onready var cross = load("res://Areas/Cross.tscn")
onready var human = load("res://Cars/Human.tscn")
# Called when the node enters the scene tree for the first time.
var geradez = 0

func _ready():
	var ger= gerade.instance()
	ger.translation.z = 20
	var g = cross.instance()
	g.translation.z = geradez
	add_child(g)
	add_child(ger)
	g.createFrom("down")
	

func spawnCar(position,rot):
	var newCar = car.instance()
	newCar.translation=position
	newCar.add_to_group("Car")
	if rot==true:
		newCar.rotation_degrees.y=180
	add_child(newCar)
	

func spawnHuman(position,left):
	var hum = human.instance()
	hum.translation=position
	
	add_child(hum)
	if(left):
		hum.left=true
	else:
		hum.right=true

func _input(event):
	if event.is_action_pressed("modechange"):
		modechange()
	
func modechange():
	var my_group_members = get_tree().get_nodes_in_group("Car")
	if(isvisible):
		for c in my_group_members:
			c.deleteSurface()
		#$AI.deleteSurface()
	else:
		for c in my_group_members:
			c.addSurface()
		#$AI.addSurface()
	isvisible=!isvisible

func setMode():
	var my_group_members = get_tree().get_nodes_in_group("Car")
	if(isvisible==false):
		for c in my_group_members:
			c.deleteSurface()
			#$AI.deleteSurface()
	else:
		for c in my_group_members:
			c.addSurface()
