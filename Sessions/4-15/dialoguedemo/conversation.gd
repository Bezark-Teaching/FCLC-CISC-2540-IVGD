extends Control

@export var dialogue : Dialogue
var currentLine = 0


func new_scene(new_dialogue):
	currentLine = -1
	dialogue = new_dialogue
	next_line()
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		next_line()

func next_line():
		currentLine += 1
		$HBoxContainer/Portrait.texture = dialogue.fancy_dialogue[currentLine].icon
		$HBoxContainer/Name.text = dialogue.fancy_dialogue[currentLine].speaker
		$HBoxContainer/Text.text = dialogue.fancy_dialogue[currentLine].text
