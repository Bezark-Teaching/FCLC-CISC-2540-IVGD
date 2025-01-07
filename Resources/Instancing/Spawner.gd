extends Node3D

const BALL = preload("res://ball.tscn")
@export var number_of_balls = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	for x in number_of_balls:
		var new_ball = BALL.instantiate()
		new_ball.position.y = randf_range(0., 10)
		add_child(new_ball)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
