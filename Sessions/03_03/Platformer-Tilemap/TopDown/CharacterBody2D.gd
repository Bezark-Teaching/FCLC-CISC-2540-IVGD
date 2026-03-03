extends CharacterBody2D


const SPEED = 100.0



func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite2D.play("walk_right")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite2D.play("walk_left")
	else:
		velocity.x = 0
	
	
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED
		$AnimatedSprite2D.play("walk_up")
		
	elif Input.is_action_pressed("ui_down"):
		velocity.y = SPEED
		$AnimatedSprite2D.play("walk_down")
	else:
		velocity.y = 0
	
	
	
	if velocity == Vector2(0,0):
		$AnimatedSprite2D.play("idle")
	
	move_and_slide()
