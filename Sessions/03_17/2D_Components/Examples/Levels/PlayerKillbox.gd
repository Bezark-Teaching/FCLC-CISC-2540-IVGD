extends Area2D






func _on_body_entered(body):
	body.position = $"../Respawn".position
	print("test change")
	
	
