extends Control
#const LEVEL_1 = preload("res://level1.tscn")
func _on_button_button_down():
	get_tree().change_scene_to_file("res://level1.tscn")
