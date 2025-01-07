extends Node2D

@export var speed = 2.0

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed
	position.y += speed
	pass
	
