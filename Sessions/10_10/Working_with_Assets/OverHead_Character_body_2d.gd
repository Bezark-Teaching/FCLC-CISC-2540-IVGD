extends CharacterBody2D

var speed = 200


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = Vector2(0,0)
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	if Input.is_action_pressed("ui_up"):
		velocity.y = -speed
	if Input.is_action_pressed("ui_down"):
		velocity.y = speed

	move_and_slide()
