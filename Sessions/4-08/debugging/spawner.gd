extends Node3D

const BALL = preload("res://ball.tscn")
@export var number_to_spawn = 1
@export var rate_increase = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for x in number_to_spawn:
		var new_ball = BALL.instantiate()
		add_child(new_ball)
	number_to_spawn+= rate_increase
