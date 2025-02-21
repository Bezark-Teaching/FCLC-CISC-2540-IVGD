extends Node2D

@export var scene_to_load : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	print(body)
	print("thing was triggered")
	get_tree().change_scene_to_packed(scene_to_load)
	
	
