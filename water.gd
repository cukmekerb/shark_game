extends StaticBody2D

onready var splash = load("res://splash.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_water_splash_hitbox_body_entered(body):
	var newsplash = splash.instance()
	newsplash.position = body.position
	newsplash.position.y = position.y - 769
	print("splash")
	get_parent().add_child(newsplash)
	pass # Replace with function body.
