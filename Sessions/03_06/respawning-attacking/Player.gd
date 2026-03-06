extends CharacterBody2D

signal respawned


@export var max_health = 5
@export var respawn_point = Vector2i(0,0)
var health : int

const SPEED = 300.0
const JUMP_VELOCITY = -400.0



func _ready() -> void:
	health = max_health


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
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if health<=0:
		respawn()



func respawn():
	position = respawn_point
	health = max_health
	respawned.emit()
	
