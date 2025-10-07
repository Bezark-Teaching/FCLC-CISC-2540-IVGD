extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_pressed("ui_right"):
		position.x += 3
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")
	elif Input.is_action_pressed("ui_left"):
		position.x -= 3
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("default")
