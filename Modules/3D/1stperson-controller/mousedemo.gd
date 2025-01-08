extends Sprite2D

var dragged = false

func _input(event):
	if event is InputEventMouseButton:
		dragged = !dragged 
	if dragged:
		position = event.position
		
