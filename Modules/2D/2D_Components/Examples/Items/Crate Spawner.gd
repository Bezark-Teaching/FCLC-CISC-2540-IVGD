extends Node2D

const RIGIDBODY_BOX = preload("res://Examples/Items/rigidbody_box.tscn")

func  _ready():
	for x in 100:
		var new_box = RIGIDBODY_BOX.instantiate()
		new_box.position.x = x*2
		add_child(new_box)
	



func _on_timer_timeout():
	var new_box = RIGIDBODY_BOX.instantiate()
	$Boxes.add_child(new_box)

