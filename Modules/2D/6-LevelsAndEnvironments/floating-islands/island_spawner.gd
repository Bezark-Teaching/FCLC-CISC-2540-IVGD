extends Node2D

@export var islands : Array[PackedScene]
@export var island_distance = 500
var previous_island_position = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame
func _process(delta):
	if $"../Camera2D".position.x > previous_island_position + island_distance:
		var new_island = islands.pick_random().instantiate()
		new_island.position.x = previous_island_position + island_distance
		new_island.position.x += randi_range(-100, 100)
		new_island.position.y += randi_range(-100, 100)
		add_child(new_island)
		previous_island_position = new_island.position.x
		
