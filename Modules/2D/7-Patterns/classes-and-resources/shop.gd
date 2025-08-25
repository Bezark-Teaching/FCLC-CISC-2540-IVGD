extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var children = get_children()
	for child in children:
		child.sell()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
