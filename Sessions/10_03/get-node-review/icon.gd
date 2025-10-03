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
		#var score_label = get_node("Label")
		#score_label.text = str("Score = ",score)
		
		$Label.text = "woo hoo!"
		
		$Heart.hide()

	
	#if position.x >= screen_width or position.x <= 0 or position.y >= screen_height or position.y <= 0:
		print("i'm off screen")


func _on_collectible_area_entered(area: Area2D) -> void:
	score += 1
	print(score)
	var score_label = get_node("Label")
	score_label.text = str("Score = ",score)
		


func _on_collectible_2_area_entered(area: Area2D) -> void:
	print('I found the second thing!')
	pass # Replace with function body.


func _on_collectible_item_collected() -> void:
	print('i collected something')
