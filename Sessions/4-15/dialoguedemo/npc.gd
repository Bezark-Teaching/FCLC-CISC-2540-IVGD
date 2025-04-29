extends Sprite2D

@export var dialogue : Dialogue

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func  _process(delta):
	#if Input.is_action_just_pressed("ui_cancel"):
		#dialogue.normals_dialgoue = dialogue.quest_complete_dialogue
		#current_line = 0
	if Input.is_action_just_pressed("ui_accept") and $DialogueBox.visible:
		current_line += 1
		if current_line < dialogue.normal_dialgoue.size():
			$DialogueBox/Label.text = dialogue.normal_dialgoue[current_line]
		else:
			$DialogueBox/Label.text = dialogue.normal_dialgoue[dialogue.normal_dialgoue.size()-1]
	
var current_line = 0

func _on_area_2d_body_entered(body):
	$"../Conversation".next_line(dialogue)
	#$DialogueBox.show()
	#$DialogueBox/Label.text = dialogue.normal_dialgoue[current_line]




func _on_area_2d_body_exited(body):
	$DialogueBox.hide()
