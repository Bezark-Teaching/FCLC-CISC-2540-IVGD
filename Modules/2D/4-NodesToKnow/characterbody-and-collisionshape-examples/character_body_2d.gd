extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -700.0

@onready var sprites = get_node("AnimatedSprite2D")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#print(direction)
	#if direction:
		#velocity.x = direction * SPEED
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED
		sprites.flip_h = false
		sprites.play("run")
		
	elif  Input.is_action_pressed("move_left"):
		velocity.x = - SPEED
		sprites.play("run")
		sprites.flip_h = true
	else:
		sprites.play("default")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
