extends Sprite2D

var score = 0

func _ready():
	print(position.x)
	print(position.y)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score = score + 1
	position.x = position.x + 1
	position.y += 20
	#print(score)
