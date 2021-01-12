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
	$Button2.hide()
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
	if GlobalVars.score > GlobalVars.hiscore:
		GlobalVars.hiscore = GlobalVars.score
	if not has_died:
		$Button.rect_position.y += 290
		$Button2.rect_position.y += 290
	$Button2.show()
	var score = floor(GlobalVars.score)
	var hiscore = floor(GlobalVars.hiscore)
	var zerozz = ""
	for i in range(4-str(score).length()):
		zerozz += "0"
	score = zerozz+str(score)
	zerozz = ""
	for i in range(4-str(hiscore).length()):
		zerozz += "0"
	hiscore = zerozz + str(hiscore)
	$AnimationPlayer.play("fadein")
	$Button.text = "Play Again"
	$Label.text = "Score: "+score+"\n Best: "+hiscore
	has_died = true
	GlobalVars.score = 0
	pass # Replace with function body.


func _on_Button2_pressed():
	GlobalVars.quit_game()
	pass # Replace with function body.
