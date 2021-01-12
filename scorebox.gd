extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ntext

onready var GlobalVars = get_node("/root/Node2D/GlobalVars")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not GlobalVars.dead:
		var score = floor(GlobalVars.score)
		var zerozz = ""
		for i in range(4-String(score).length()):
			zerozz += "0"
		text = zerozz+ str(score)

