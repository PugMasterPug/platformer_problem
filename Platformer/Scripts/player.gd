extends KinematicBody2D

var spd = 400
var acc = 10
var dec = 12

var jmpSpd = 400

const GRAVITY = 1100

var speed = Vector2()

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			speed.y = -jmpSpd
	
	var desiredSpd = 0
	if Input.is_action_pressed("ui_right"):
		desiredSpd = spd
	if Input.is_action_pressed("ui_left"):
		desiredSpd -= spd
	if desiredSpd == 0:
		speed.x += (desiredSpd - speed.x)*dec*delta
	else:
		speed.x += (desiredSpd - speed.x)*acc*delta
	
	speed.y += GRAVITY*delta
	
	speed = move_and_slide(speed, Vector2(0, -1))
	pass