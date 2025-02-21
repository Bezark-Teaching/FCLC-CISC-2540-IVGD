extends Node2D

var falling_platform = preload("res://Obstacles/Falling Platforms/falling_platform.tscn")
var positions = []
# Called when the node enters the scene tree for the first time.
func _ready():
	var children = get_children()
	for child in children:
		positions.append(child.position)



func respawn_platforms():
	for child in get_children():
		child.queue_free()
	for position in positions:
		var new_falling_platform = falling_platform.instantiate()
		new_falling_platform.position = position
		add_child(new_falling_platform)


func _on_frog_spawning():
	respawn_platforms()
