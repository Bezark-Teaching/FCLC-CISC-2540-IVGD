extends Sprite2D

signal player_died
@export var speed = 0

var score = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var score_label = get_node("Score")
	print(score_label)
	score_label.text = str(score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_right"):
		position.x += speed
	if Input.is_action_pressed("move_left"):
		position.x -= speed
	if Input.is_action_pressed("move_down"):
		position.y += speed
	if Input.is_action_pressed("move_up"):
		position.y -= speed
		score += 1
		var score_label = get_node("Score")
		score_label.text = str(score)


func _on_timer_timeout() -> void:
	print('time is up')
	hide()
	player_died.emit()
	



func _on_area_2d_area_entered(area: Area2D) -> void:
	area.queue_free()
	score += 1
	$Score.text = str(score)
