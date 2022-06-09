extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func setDistance(var distance):
	$Label2.text="Distance:"+str((int(distance)*-1)/100)+"m"

func gameOver():
	$AnimationPlayer.play("gameOver")
	
func _on_Button_pressed():
	var _erg=get_tree().change_scene("res://Player/MainMenu.tscn")
