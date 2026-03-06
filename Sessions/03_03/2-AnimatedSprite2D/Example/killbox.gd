extends Area2D


func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "Player":
		#get_tree().reload_current_scene()
		body.die()
	else:
		body.queue_free()
