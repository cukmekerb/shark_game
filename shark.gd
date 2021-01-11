extends KinematicBody2D
var velocity = Vector2()
var move_speed = 0.5
var gravity = 50
var player
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_node("character")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.y += gravity
	var look_position = player.position
	if look_position.x - position.x < -3:
		look_position.x = position.x + abs(position.x - look_position.x)
		look_position.y = position.y + abs(position.y - look_position.y)
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	look_at(look_position)
	velocity.x = move_speed*(player.position.x - position.x) 
	move_and_slide(velocity, Vector2(0,-1))
	velocity.x = lerp(velocity.x, 0, 0.05)
