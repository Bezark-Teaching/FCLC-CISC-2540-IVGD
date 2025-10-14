extends Node2D

@onready var platform = $Platform

var speed = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	platform.position.x += speed
	if platform.position.x> 100:
		speed = -1
	elif platform.position.x < -100:
		speed = 1
