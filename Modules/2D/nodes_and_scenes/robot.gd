extends Sprite2D

@export var movement_rate = 2
var my_greeting = "hello my name is john!"
# Called when the node enters the scene tree for the first time.
func _ready():
	print("hello world")
	print(position.x)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(my_greeting)
	#position.y = position.y+movement_rate
	position.x += movement_rate
	
	#print(position)
	var window_x_size = get_viewport_rect().size.x
	if position.x > window_x_size or position.x < -window_x_size:
		movement_rate = -movement_rate 
	#
	pass
