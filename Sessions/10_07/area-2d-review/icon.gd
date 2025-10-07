extends Sprite2D
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("walk"):
		position.x += 3
	else:
		position.x -= 1.5


func _on_area_2d_area_entered(area: Area2D) -> void:
	
	score += area.value
	print(score)
	area.queue_free()
