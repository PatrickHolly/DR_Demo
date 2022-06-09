extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var mat = get_surface_material(0)
	var array = mesh.surface_get_arrays(0)
	mesh = ArrayMesh.new()
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_LINE_STRIP, array)
	set_surface_material(0, mat)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
