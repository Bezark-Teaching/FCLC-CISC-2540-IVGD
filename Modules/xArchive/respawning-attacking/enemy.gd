extends CharacterBody2D

@export var max_health  = 3
var health : int
var starting_position : Vector2i

var attack_target
var can_attack = false
var player_in_range = false

@export var move_left = true

@export var SPEED = 200.0



func _ready() -> void:
	starting_position = position
	health = max_health



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	
	velocity.x = SPEED
	# will either run to the left or the right
	if move_left:
		velocity.x = -velocity.x

	move_and_slide()
	
	if can_attack and player_in_range:
		print("attacking player")
		attack_target.health -= 1
		$AttackCooldown.start()
		can_attack = false




func spawn():
	health = max_health
	position = starting_position
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name== "Player" :
		can_attack = true
		player_in_range = true
		attack_target = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name== "Player" :
		player_in_range = false

func _on_attack_cooldown_timeout() -> void:
	can_attack = true
