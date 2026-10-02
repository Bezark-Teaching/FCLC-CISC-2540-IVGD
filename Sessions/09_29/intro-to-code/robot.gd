extends Sprite2D

#var number = 0
@export var speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	print(position.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	position.x = position.x + speed
	position.y += speed
	#print(position)
	#scale.x += 2
	#scale.y += 2
	#skew += 1
	#number = number + 20
	#position.x = number
	#position.y = number/2
