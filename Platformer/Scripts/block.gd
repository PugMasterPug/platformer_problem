extends KinematicBody2D

var time = 0

var colliding = false

var speed = Vector2()

func _physics_process(delta):
	time += delta
	
	speed.y = 128*cos(2*PI*time/float(2)*2)
	
	position.y += speed.y*delta
	
	if colliding:
		var player = get_node("/root/Node2D/Player")
		player.position.y += speed.y*delta
		#player.speed = speed
	pass


func body_enter( body ):
	if body.is_in_group("Player"):
		colliding = true
	pass


func body_exit( body ):
	if body.is_in_group("Player"):
		colliding = false
	pass
