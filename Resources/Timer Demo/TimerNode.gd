extends Timer

var length = 5

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		start()


func _on_timeout():
	if length>0:
		length -= 1
		$Label.text = str(length)
		if length <= 0:
			print("done!")
	
