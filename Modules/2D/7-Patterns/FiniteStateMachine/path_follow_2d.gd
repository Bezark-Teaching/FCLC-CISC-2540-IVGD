extends Path2D
@export var speed = 10
var prev_pos =Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$PathFollow2D.progress_ratio += speed*0.001
	if $PathFollow2D.global_position.x < prev_pos.x:
		print('moving left')
	else:
		print('movin right')
	prev_pos = $PathFollow2D.global_position
