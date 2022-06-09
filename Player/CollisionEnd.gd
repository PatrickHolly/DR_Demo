extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func startAnim():
	$AnimationPlayer.play("fadeIn")


func setTime(timeleft):
	var seconds = str((timeleft/60)%60)
	if(seconds.length()==1):
		seconds = "0"+seconds
	$Time.text= "Time left: "+str((timeleft/60)/60)+":"+seconds

func setDistance(distance):
	$Distance.text="Distance:"+str((int(distance)*-1)/100)+"m"

func _on_Button_pressed():
	var _erg=get_tree().change_scene("res://Player/MainMenu.tscn")
