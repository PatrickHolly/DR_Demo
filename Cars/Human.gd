extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
var left=false
var right=false
var lifetime=3600
var invisible = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Peasant")
	rng.randomize()
	invisible = rng.randi_range(100,1200)
	pass # Replace with function body.

var moving=true;

func _physics_process(_delta):
	if(invisible>0):
		invisible-=1
		pass
	else:
		if moving:
			visible=true
			lifetime-=1
			if lifetime==0:
				queue_free()
			if left:
				var _erg=move_and_slide(Vector3(1,0,0),Vector3.UP)
			if right:
				var _erg= move_and_slide(Vector3(-1,0,0),Vector3.UP)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	if(right):
		print("collide")
		moving=false


func _on_Area_body_exited(body):
	if(right):
		print("uncollide")
		moving=true


func _on_Area2_body_entered(body):
	if(left):
		print("collide")
		moving=false


func _on_Area2_body_exited(body):
	if(left):
		print("uncollide")
		moving=true
