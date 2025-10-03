extends Node2D

@export var speed = 8
@export var character_name = "Stacy"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('hello')
	print(character_name)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	#my_number = my_number + 1
	#position.x = my_number
	position.x += speed
	position.y += speed
