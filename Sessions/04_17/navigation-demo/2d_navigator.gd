extends CharacterBody2D
@export var speed = 100


func _ready():
	$NavigationAgent2D.target_position = $"../Destination".position

func _physics_process(delta: float) -> void:
	
	var next_position = $NavigationAgent2D.get_next_path_position()
	var distance_to_next_spot :Vector2 = next_position- global_position
	distance_to_next_spot = distance_to_next_spot.normalized()
	velocity =  distance_to_next_spot*speed
	move_and_slide()
	
	
	pass
