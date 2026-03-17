extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		print(body)
		#get_tree().reload_current_scene()
		body.kill()
	else:
	
		body.queue_free()
