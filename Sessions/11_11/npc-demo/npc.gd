extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _ready() -> void:
	$NavigationAgent3D.target_position = $Destination.position

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if $NavigationAgent3D.is_navigation_finished():
		return
	
	var current_agent_position: Vector3 = global_position
	var next_path_position: Vector3 = $NavigationAgent3D.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * SPEED
	move_and_slide()

	
