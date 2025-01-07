extends Node2D

var little_tree
# Called when the node enters the scene tree for the first time.
func _ready():
	little_tree = get_node("Little_tree")
	little_tree.scale = Vector2(0.1, 0.1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
