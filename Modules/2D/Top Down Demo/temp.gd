extends Node2D

var speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	print(position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		position.x = position.x + speed
	if Input.is_action_pressed("ui_left"):
		position.x = position.x - speed
