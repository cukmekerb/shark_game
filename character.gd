extends KinematicBody2D
var velocity = Vector2()
var move_speed = 550
var jump_speed = -1800
var gravity = 50
var been_on_floor = 0
var floor_treshold = 2
var can_jump = 1.5
onready var start_pos = position
var dead = false
signal die
onready var GlobalVars = get_node("/root/Node2D/GlobalVars")
# Called when the node enters the scene tree for the first time.
func _ready():
	$animatedsprite.play("diving")
	$arms.get_node("AnimationPlayer").play("spin")
	$arms.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not dead:
		velocity.y += gravity
		if Input.is_action_pressed("move_r"):
			$arms.get_node("AnimationPlayer").playback_speed = 1
			velocity.x = move_speed
		if Input.is_action_pressed("move_l"):
			$arms.get_node("AnimationPlayer").playback_speed = -1
			velocity.x = -move_speed
		if Input.is_action_just_pressed("move_u") and (is_on_floor() or can_jump < 1.5):
			can_jump += 1
			if can_jump < 1.5:
				velocity.y = jump_speed
			else:
				velocity.y = jump_speed/1.2
			print(can_jump)
		if is_on_floor() and been_on_floor > floor_treshold:
			rotation_degrees = 90
			if can_jump > 0:
				can_jump -= 0.5
			$animatedsprite.play("swimming")
			$arms.show()
		elif is_on_floor():
			if been_on_floor < 0:
				been_on_floor = 0
			been_on_floor +=1
		elif been_on_floor > 0:
			been_on_floor = 0
		elif been_on_floor < -floor_treshold:
			rotation_degrees = 0
			$animatedsprite.play("diving")
			$arms.hide()
		else:
			been_on_floor -= 1
		move_and_slide(velocity, Vector2(0,-1))
		velocity.x = lerp(velocity.x, 0, 0.05)
		GlobalVars.score += 0.1
	else:
		velocity.y = 2*(start_pos.y - position.y) 
		velocity.x = 2*(start_pos.x - position.x) 
		move_and_slide(velocity,Vector2(0,-1))
		velocity.x = lerp(velocity.x, 0, 0.05)
		velocity.y = lerp(velocity.y, 0, 0.05)



func _on_Area2D_body_entered(body):
	print(start_pos, position)
	if body.name == "shark":
		print("dying")
		dead = true
		GlobalVars.dead = dead
		emit_signal("die")


func _on_Panel_play_again():
	dead = false
	GlobalVars.dead = dead
	pass # Replace with function body.
