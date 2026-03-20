extends CharacterBody2D

@export var max_health = 3
var health
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite_2d = $AnimatedSprite2D

var respawn_position = Vector2(0,0)


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var alive = true


func _ready() -> void:
	%ProgressBar.max_value = max_health
	health = max_health
	%ProgressBar.value = health

func _physics_process(delta):
	# Add the gravity.
	if alive:
		if not is_on_floor():
			velocity.y += gravity * delta

		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
			animated_sprite_2d.play("run")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()
	
	
	
		if velocity.x < 0:
			animated_sprite_2d.flip_h = true
		elif velocity.x > 0:
			animated_sprite_2d.flip_h = false
		elif velocity == Vector2.ZERO:
			animated_sprite_2d.play("idle")

func damage(amount):
	$AnimationPlayer.play("damage")
	health -= amount
	%ProgressBar.value = health
	if health <= 0:
		kill()

func kill():
	#
	#$"../Respawn".position
	print("I'm dead!")
	
	alive = false
	animated_sprite_2d.play("death")
	


func _on_animated_sprite_2d_animation_finished():
	if animated_sprite_2d.animation == "death":
		respawn()

func respawn():
	animated_sprite_2d.play("idle")
	position  = respawn_position
	health = max_health
	alive = true
	
