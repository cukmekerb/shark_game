extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var GlobalVars = get_node("/root/Node2D/GlobalVars")
var has_died = false
signal play_again
# Called when the node enters the scene tree for the first time.
func _ready():
	show()
	get_tree().paused = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	if not has_died:
		$AnimationPlayer.play("fadeout")
		get_tree().paused = false
	else:
		$AnimationPlayer.play("fadeout")
		emit_signal("play_again")


func _on_character_die():
	var score = floor(GlobalVars.score)
	var zerozz = ""
	for i in range(4-String(score).length()):
		zerozz += "0"
	score = zerozz+str(score)
	$AnimationPlayer.play("fadein")
	$Button.text = "Play Again"
	$Label.text = "Score: "+score
	has_died = true
	GlobalVars.score = 0
	pass # Replace with function body.
