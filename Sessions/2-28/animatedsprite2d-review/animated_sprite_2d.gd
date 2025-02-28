extends AnimatedSprite2D

var attacking = false



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_RIGHT):
		position.x  += 5
		play("run")
		flip_h = false
	elif Input.is_key_pressed(KEY_LEFT):
		position.x -= 5
		play("run")
		flip_h = true
	elif Input.is_key_pressed(KEY_SPACE) or attacking:
		play("attack")
		attacking = true
	else:
		play("idle")


func _on_animation_finished():
	
	if animation == "attack":
		print("done attacking")
		attacking = false
