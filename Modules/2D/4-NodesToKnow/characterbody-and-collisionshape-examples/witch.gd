extends CharacterBody2D

@onready var sprites: AnimatedSprite2D = $Sprites

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var attacking = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if not attacking:
		if direction:
			if direction <0:
				sprites.flip_h = true
			else:
				sprites.flip_h = false
			velocity.x = direction * SPEED
			sprites.play("run")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			sprites.play("idle")

	move_and_slide()
	
	if Input.is_action_just_pressed("ui_end"):
		attacking = true
		sprites.play("attack")


func _on_sprites_animation_finished() -> void:
	if sprites.animation == "attack":
		attacking = false
