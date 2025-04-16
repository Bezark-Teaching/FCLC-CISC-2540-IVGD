extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	# Add the gravity.
	
	# Handle jump.
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")*SPEED
	

	move_and_slide()
