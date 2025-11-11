extends CharacterBody2D


@export var dialogue: Array[String] 
var dialogue_progress = 0

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
		'talking':
			
			if Input.is_action_just_pressed("ui_accept"):
				dialogue_progress += 1
				if dialogue_progress > dialogue.size()-1:
					$DBox.hide()
				else:
					$DBox.show()
					$DBox/Label.text = dialogue[dialogue_progress]
		
	

	move_and_slide()


var target = Vector2(0.,0.)
func _on_vision_body_entered(body):
	if body.is_in_group("player"):
		
		state = "talking"
		target = body.position
		print("changing state to moving")


func _on_vision_body_exited(body):
	$DBox.hide()
	state = "idle"
	velocity = Vector2(0.,0.)
	print("changing state to idle")


func _on_hitbox_body_entered(body):
	if body.is_in_group("player"):
		state= "dying"
