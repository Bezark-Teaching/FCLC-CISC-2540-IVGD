extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_right"):
		position.x += 4
	if Input.is_action_pressed("move_left"):
		position.x -= 4


func _on_area_2d_mouse_entered():
	print("hi mouse!")


func _on_area_2d_area_entered(area):
	print("you entered the area!")
	var label = get_node("Label")
	label.text = area.popup_text
	label.show()


func _on_area_2d_area_exited(area):
	var label = get_node("Label")
	label.hide()
