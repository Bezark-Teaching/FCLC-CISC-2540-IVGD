extends Node2D

var score = 0
@export var speed = 5

func _ready():
	Engine.max_fps = 60


# Called when the node enters the scene tree for the first time.
func _process(delta):
	#print(Input.is_action_pressed("ui_accept"))
	#if Input.is_action_pressed("ui_accept"):
		##print("you pressed a button")
		#position.x += 1
	#
	if Input.is_action_pressed("ui_down"):
		position.y += speed
	if Input.is_action_pressed("ui_up"):
		position.y -= speed
	if Input.is_action_pressed("ui_right"):
		position.x += speed
	if Input.is_action_pressed("ui_left"):
		position.x -= speed
	
	
	pass
	
	
	#
	#score += 1
	#if score > 20:
		## Thing we do if tuer
		#print("you win!")
	#else:
		##Thing we do if false
		#print("keep playing")
#
#func _input(event):
	#print(event)
