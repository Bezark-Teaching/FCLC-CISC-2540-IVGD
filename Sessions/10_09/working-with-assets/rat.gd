extends AnimatedSprite2D


@export var speed = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_select"):
		play("attack")
	elif Input.is_action_pressed("ui_left"):
		position.x -= speed
		play("run")
		flip_h = true
	elif Input.is_action_pressed("ui_right"):
		position.x += speed
		flip_h = false
		play("run")
	else:
		play("idle")
