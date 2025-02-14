extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	print("you picked me up!")
	hide()
	$AudioStreamPlayer2D.play()
	body.my_cool_function()
	body.change_score(1)
