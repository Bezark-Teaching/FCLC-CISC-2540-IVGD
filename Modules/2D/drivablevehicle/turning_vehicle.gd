extends CharacterBody2D

@export var speed = 500
@export var turn_speed = 0.1

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_left"):
		rotate(-turn_speed)
	if Input.is_action_pressed("ui_right"):
		rotate(turn_speed)
  	
	if Input.is_action_pressed("ui_up"):
		# Convert rotation into a direction vector
		var direction = Vector2.UP.rotated(rotation)
		velocity = direction * speed
	elif Input.is_action_pressed("ui_down"):
		# Convert rotation into a direction vector
		var direction = Vector2.UP.rotated(rotation)
		velocity = -direction * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
