extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


	


func _on_timer_timeout():
	$AnimatedSprite2D.play("off")
	freeze = false
	var tween = get_tree().create_tween()
	tween.tween_property($AnimatedSprite2D, "modulate", Color.TRANSPARENT, 1)
	tween.tween_callback(self.queue_free)



	


func _on_area_2d_body_entered(body):
	$Timer.start()
	print("start")
