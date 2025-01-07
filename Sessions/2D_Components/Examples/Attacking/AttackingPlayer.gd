extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


@export var max_health = 50
var health = max_health


@onready var animated_sprite_2d = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var alive = true

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
	health -= amount
	prints("health:", health)
	if health <= 0:
		health = 0
		kill()
	$AnimationPlayer.play("damage")

func kill():
	#position = $"../Respawn".position
	print("I'm dead!")
	
	alive = false
	animated_sprite_2d.play("death")
	


func _on_animated_sprite_2d_animation_finished():
	if animated_sprite_2d.animation == "death":
		animated_sprite_2d.play("idle")
		position = $"../Respawn".position
		alive = true
		health = max_health
		

