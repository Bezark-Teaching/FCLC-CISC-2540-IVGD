extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", Vector2(position.x, 500), 0.5).set_trans(Tween.TRANS_BOUNCE)
		tween.tween_property(self, "position", Vector2(position.x, 536), 0.5).set_trans(Tween.TRANS_SINE)


		
