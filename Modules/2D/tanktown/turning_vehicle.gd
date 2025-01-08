extends CharacterBody2D

@export var speed = 200
@export var turn_speed = 0.025

@export var amunition : PackedScene

@onready var canon: Sprite2D = $Canon


func _physics_process(delta):
	
	if Input.is_action_pressed("left"):
		rotate(-turn_speed)
	if Input.is_action_pressed("right"):
		rotate(turn_speed)
  	
	
	
	if Input.is_action_pressed("forward"):
		# Convert rotation into a direction vector
		var direction = Vector2.UP.rotated(rotation)
		velocity = direction * speed
	elif Input.is_action_pressed("backward"):
		# Convert rotation into a direction vector
		var direction = Vector2.UP.rotated(rotation)
		velocity = -direction * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	
	## Aiming
	if Input.is_action_pressed("aim_left"):
		canon.rotate(-turn_speed)
	if Input.is_action_pressed("aim_right"):
		canon.rotate(turn_speed)
	if Input.is_action_just_pressed("fire"):
		fire()



func fire():
	var new_projectile : Projectile = amunition.instantiate()
	new_projectile.velocity = Vector2(sin($Canon/Tip.global_rotation), -remap(abs($Canon/Tip.global_rotation),0., 1.57, 1., 0.)) *new_projectile.speed
	new_projectile.position = $Canon/Tip.global_position
	new_projectile.rotation = $Canon/Tip.global_rotation
	#new_projectile.look_at(new_projectile.velocity)
	$Projectiles.add_child(new_projectile)
