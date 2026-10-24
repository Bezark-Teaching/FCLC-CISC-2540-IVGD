extends Area2D






func _on_body_entered(body):
	#body.position = $"../Respawn".position
	#get_tree().reload_current_scene()
	body.kill()
	
