extends AnimatedSprite2D




func _on_area_2d_body_entered(body):
	play("pop")
	$collect.play()



func _on_animation_finished():
	if animation == "pop":
		queue_free()
