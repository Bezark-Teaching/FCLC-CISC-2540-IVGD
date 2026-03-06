extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -200.0
var jumping = false

var alive = true

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta):

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumping = false

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite_2d.play("jump")
		jumping = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if not jumping:
			animated_sprite_2d.play("walk")
		if direction == -1:
			animated_sprite_2d.flip_h = true
		else:
			animated_sprite_2d.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if not jumping and alive:
			$AnimatedSprite2D.play("default")

	move_and_slide()
	
	
	
func die():
	print('i died')
	alive = false
	animated_sprite_2d.play("death")


func _on_animated_sprite_2d_animation_finished() -> void:
	print('animation finished')
	if animated_sprite_2d.animation == "death":
		get_tree().reload_current_scene()
