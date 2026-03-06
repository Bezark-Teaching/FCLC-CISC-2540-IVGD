extends Timer


# Called when the node enters the scene tree for the first time.


func _on_timeout() -> void:
	get_tree().change_scene_to_file("res://MainMenu.tscn")
