extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.timeout.connect(done)
	$Area2D.area_entered.connect(area_entered)

func done():
	print('done!')

func area_entered(area):
	print(area)
