extends CharacterBody2D

@export var speed = 500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = - speed
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		velocity.y = - speed
	else:
		velocity.x = 0
		velocity.y = 0
		#velocity = Vector2(0,0)
	move_and_slide()
	pass
