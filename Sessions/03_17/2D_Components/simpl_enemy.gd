extends CharacterBody2D

@export var damage = 1

@export var speed = 1
var length_of_movement = 5000
var movement_counter = 0

func _physics_process(delta: float) -> void:
	velocity.x = speed
	movement_counter += speed
	if movement_counter > length_of_movement:
		speed = -speed
		movement_counter =0
	
	move_and_slide()
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		body.damage(damage)
