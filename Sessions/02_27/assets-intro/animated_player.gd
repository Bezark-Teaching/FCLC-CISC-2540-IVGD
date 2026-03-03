extends AnimatedSprite2D


@export var speed = 5

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		position.x -= speed
		flip_h = true
		play("walk")
	elif Input.is_action_pressed("ui_right"):
		position.x += speed
		flip_h = false
		play("walk")
	else:
		play("default")
