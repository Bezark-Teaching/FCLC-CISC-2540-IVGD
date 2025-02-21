extends Node2D
@export var Speed = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Path/Follower.progress_ratio += delta*Speed

