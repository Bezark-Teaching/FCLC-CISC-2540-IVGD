extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_icon_counter_max_reached():
	print("the counter is done")

var score = 0
func _on_icon_scored_a_point():
	score += 1
	print(score)
