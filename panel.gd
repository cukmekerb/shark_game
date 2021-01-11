extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
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
	$AnimationPlayer.play("fadein")
	$Button.text = "Play Again"
	has_died = true
	pass # Replace with function body.
