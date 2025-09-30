extends Sprite2D

@export var speed = 10
var score = 0

var screen_width = 0
var screen_height = 0


func _ready() -> void:
	var current_window = get_window()
	screen_width = current_window.size.x
	screen_height = current_window.size.y
	prints(screen_height, screen_width)
	

func _process(delta: float) -> void:
	if Input.is_action_pressed("move_down"):
		position.y += speed
	if Input.is_action_pressed("move_up"):
		position.y -= speed
	if Input.is_action_pressed("move_right"):
		position.x += speed
	if Input.is_action_pressed("move_left"):
		position.x -= speed
		
	
	if Input.is_action_just_pressed("jump"):
		print("I jumped!")
		score += 1
		print(score)
		var score_label = get_node("Label")
		score_label.text = str("Score = ",score)
		
		$Heart.hide()

	
	#if position.x >= screen_width or position.x <= 0 or position.y >= screen_height or position.y <= 0:
		print("i'm off screen")
