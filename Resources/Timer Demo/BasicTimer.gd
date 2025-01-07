extends Node2D

var length = 500
var timePassed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timePassed += 1
	if timePassed >= length:
		print("done!")
	else:
		print(timePassed)
