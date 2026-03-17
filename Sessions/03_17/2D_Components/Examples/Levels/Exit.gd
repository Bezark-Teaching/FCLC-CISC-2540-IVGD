extends Node2D

@export var next_level : PackedScene


func _on_area_2d_body_entered(body):
	print(next_level.resource_path)
	get_tree().change_scene_to_file(next_level.resource_path)
