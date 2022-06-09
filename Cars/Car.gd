extends KinematicBody

# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	randomizeColor()
	
	add_to_group("Car")
	pass # Replace with function body.

var starttime= 10

func set_starttime(time):
	starttime=time

var moving = false
var obstacle = false

onready var follow = get_parent()
var speed=0
func _physics_process(delta):
	if starttime<=0:
		moving=true
	else:
		starttime-=1
	if obstacle:
		$Bremslicht.visible=true
		$Bremslicht2.visible=true
		if speed>0:
			speed-=0.3
			if speed<0:
				speed=0
	else:
		$Bremslicht.visible=false
		$Bremslicht2.visible=false
		speed+=0.1
		if speed>10:
			speed=10
	if(moving):
		follow.set_offset(follow.get_offset()+speed*delta)
		

func deleteSurface():
	$Car2.visible=false
	$Car1.visible=true
	
func addSurface():
	$Car1.visible=false
	$Car2.visible=true
	
func randomizeColor():
	randomize()
	var material = SpatialMaterial.new()
	material.albedo_color = Color(randf(), randf(), randf())
	$Car2.set_surface_material(0, material)
	$Car1.set_surface_material(0, material)
	

var obstaclesList = []

func _on_Area_body_entered(body):
	if(body.is_in_group("Player")||body.is_in_group("Peasant")||body.is_in_group("Car")):
		if(body!=self):
			obstaclesList.append(body)
			obstacle=true


func _on_Area_body_exited(body):
	if(body.is_in_group("Player")||body.is_in_group("Peasant")||body.is_in_group("Car")):
		if(body!=self):
			obstaclesList.erase(body)
			if(obstaclesList.size()==0):
				obstacle=false


func _on_Area_area_entered(_area):
	pass # Replace with function body.
