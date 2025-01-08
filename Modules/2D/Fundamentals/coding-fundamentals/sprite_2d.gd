extends Sprite2D

var number = 0
@export var speed = 2.0
@export var acceleration = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	#print("Hello class")
	#print(position)
	#position = Vector2(100, 100)
	#print(position)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	number = number +1
	#print(position.x)
	position.x = position.x + speed
	#position.y += speed
	#speed += acceleration
	#scale.x += 0.1
	#scale.y += 0.1
	scale += Vector2(0.1,0.1)
	
