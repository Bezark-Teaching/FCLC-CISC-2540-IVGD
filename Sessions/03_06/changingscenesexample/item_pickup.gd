extends Area2D

@export var item_scene : PackedScene


func _on_body_entered(body: Node2D) -> void:
	var new_item = item_scene.instantiate()
	body.add_child(new_item)
	new_item.global_position = body.global_position
	queue_free()
