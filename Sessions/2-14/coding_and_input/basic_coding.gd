extends Sprite2D

var x = 100
@export var speed = 10
@export var health = 5
@export var damage = 100
@export var character_name = "Jim"

# Called when the node enters the scene tree for the first time.
func _ready():
	print("hello my name is "+character_name)
	print(position.x)


func _process(delta):
	position.x += speed
	position.y += speed

	#print("hello robot")
