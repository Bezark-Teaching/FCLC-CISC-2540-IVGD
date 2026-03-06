extends Node2D

#@export var scene_to_load : PackedScene

@export var scene_to_load : PackedScene



func _on_area_2d_body_entered(body):
	print(body)
	print("thing was triggered")
	#get_tree().change_scene_to_file("res://home_base.tscn")
	get_tree().change_scene_to_packed(scene_to_load)
	#get_tree().change_scene_to_file("res://level_1.tscn")
	
	
