extends CharacterBody2D


const SPEED = 300.0
@export var state = "idle"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	
	match state:
		"idle":
			pass
		"moving":
			velocity = target - position
		"dying":
			state = "idle"
			queue_free()
		
	

	move_and_slide()


var target = Vector2(0.,0.)
func _on_vision_body_entered(body):
	if body.is_in_group("player"):
		state = "moving"
		target = body.position
		print("changing state to moving")


func _on_vision_body_exited(body):
	state = "idle"
	velocity = Vector2(0.,0.)
	print("changing state to idle")


func _on_hitbox_body_entered(body):
	if body.is_in_group("player"):
		state= "dying"
