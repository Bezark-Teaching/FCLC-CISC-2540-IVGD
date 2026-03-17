extends Node2D





func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		body.respawn_position = global_position
