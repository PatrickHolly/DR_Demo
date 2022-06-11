extends Area
var x = 0
var z = 0


var isUsed=false
onready var gerade = load("res://Areas/Gerade.tscn")
onready var geradeRot = load("res://Areas/GeradeRotated.tscn")
onready var cross = load("res://Areas/Cross.tscn")
onready var human = load("res://Cars/Human.tscn")
onready var CAR = load("res://Cars/Car.tscn")
onready var LKW = load("res://Cars/Lkw.tscn")

var geradez = -20
var geradex1 = -20 
var geradex2 = 20

var front;
var left;
var right;

var rng = RandomNumberGenerator.new()
var nextcar;
var carcounter=0;

func _ready():
	nextcar = rng.randi_range(30,300)
	
	
func _process(_delta):
	nextcar-=1;
	if(nextcar<=0 && carcounter<8):
		nextcar = rng.randi_range(30,300)
		carcounter+=1
		generateCar()


func generateCar():
	var _curve1 = Curve3D.new()
	var heigth=1.6
	_curve1.add_point(Vector3(40,heigth,-2))
	_curve1.add_point(Vector3(6,heigth,-2))
	_curve1.add_point(Vector3(3.5,heigth,-3.5))
	_curve1.add_point(Vector3(2,heigth,-6))
	_curve1.add_point(Vector3(2,heigth,-115))
	_curve1.add_point(Vector3(10,heigth,-120))
	_curve1.add_point(Vector3(40,heigth,-120))
	
	var _curve2 = Curve3D.new()
	_curve2.add_point(Vector3(40,heigth,-2))
	_curve2.add_point(Vector3(6,heigth,-2))
	_curve2.add_point(Vector3(3.5,heigth,-3.5))
	_curve2.add_point(Vector3(2,heigth,-6))
	_curve2.add_point(Vector3(2,heigth,-235))
	_curve2.add_point(Vector3(5,heigth,-238))
	_curve2.add_point(Vector3(10,heigth,-240))
	_curve2.add_point(Vector3(40,heigth,-240))
	
	var _curve3 = Curve3D.new()
	_curve3.add_point(Vector3(40,heigth,-2))
	_curve3.add_point(Vector3(6,heigth,-2))
	_curve3.add_point(Vector3(3.5,heigth,-3.5))
	_curve3.add_point(Vector3(2,heigth,-6))
	_curve3.add_point(Vector3(2,heigth,-115))
	_curve3.add_point(Vector3(-8,heigth,-125))
	_curve3.add_point(Vector3(-40,heigth,-125))
	
	var _curve4 = Curve3D.new()
	_curve4.add_point(Vector3(40,heigth,-2))
	_curve4.add_point(Vector3(6,heigth,-2))
	_curve4.add_point(Vector3(3.5,heigth,-3.5))
	_curve4.add_point(Vector3(2,heigth,-6))
	_curve4.add_point(Vector3(2,heigth,-235))
	_curve4.add_point(Vector3(2,heigth,-238))
	_curve4.add_point(Vector3(-8,heigth,-245))
	_curve4.add_point(Vector3(-40,heigth,-245))
	
	var _path = Path.new()
	add_child(_path)
	rng.randomize()
	match rng.randi_range(0,3):
		0:
			_path.set_curve(_curve1)
		1:
			_path.set_curve(_curve2)
		2:
			_path.set_curve(_curve3)
		3:
			_path.set_curve(_curve4)
	
	
	
	var _follow = PathFollow.new()
	_path.add_child(_follow)
	_follow.loop=false
	var car
	
	match rng.randi_range(0,2):
		0:
			car = LKW.instance()
			
		1:
			car = CAR.instance()
			
		2:
			car = CAR.instance()
			
	car.set_scale(Vector3(0.7,0.7,0.7))
	_follow.add_child(car)
	_follow.rotation_degrees.y=90
	car.visible=false


func setPosition(x1,z1):
	x=x1
	z=z1

func createFrom(var direction):
	if direction == "down":
		for _i in range(0,5):
			var g = gerade.instance()
			g.translation.z = geradez+z
			g.translation.x=x
			get_parent().add_child(g)
			g.fuessgaenger()
			geradez-=20
		front = cross.instance()
		front.translation.z = geradez+z
		front.translation.x = x
		
		front.x = x
		front.z = geradez+z
		get_parent().add_child(front)
			
		for _i in range(0,3):
			var g = geradeRot.instance()
			g.translation.x = geradex1 
			g.translation.z = z
			get_parent().add_child(g)
			geradex1-=20
			
		left = cross.instance()
		left.translation.z = z
		left.translation.x = geradex1
		get_parent().add_child(left)
		
		for _i in range(0,3):
			var g = geradeRot.instance()
			g.translation.x = geradex2
			g.translation.z=z
			get_parent().add_child(g)
			geradex2+=20
		
		right = cross.instance()
		right.translation.z = z
		right.translation.x = geradex1
		get_parent().add_child(right)
		get_parent().setMode() #updates car mode


onready var KI = load("res://Cars/Car.tscn")
	
	

func _on_Area_body_entered(body):
	if(body.is_in_group("Player")):
		front.createFrom("down")

