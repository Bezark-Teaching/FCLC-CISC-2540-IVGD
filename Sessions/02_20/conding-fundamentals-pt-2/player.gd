extends Sprite2D

var score = 0
@export var health = 50
@export var speed = 0.1

@export var is_moving = false

func _ready():
	print(position.x)
	print(position.y)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_right"):
		position.x += speed
		position.y +=  speed
	
