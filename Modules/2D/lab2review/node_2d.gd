extends Node2D

@export var name_of_variable = 2
var thing_to_test = false
var health = 5# Called when the node enters the scene tree for the first time.
func _ready():
	if health == 0:
		print("you dead")
	elif health == 5:
		print("you're sort of healthy..")
	else:
		print("you healthy")
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			print("i clicked")
	if Input.is_action_just_pressed("ui_accept"):
		visible = !visible
		


func _on_button_button_down():
	print("you pressed the button")


func _on_button_button_up():
	print("you stopped pressing the button!")
