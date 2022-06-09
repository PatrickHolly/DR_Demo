extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.


func _ready():
	randomizeColor()
	$Car1.visible=false

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
	
