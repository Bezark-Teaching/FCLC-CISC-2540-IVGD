extends Node2D

const THING = preload("res://Thing.tscn")

func _on_timer_timeout():
	print("time to do something")
	var new_thing = THING.instantiate()
	new_thing.position.y = -50
	new_thing.position.x = randi_range(0, 1156)
	add_child(new_thing)
