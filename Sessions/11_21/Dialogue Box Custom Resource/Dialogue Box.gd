extends Panel

@export var lines : Array[LineOfDialogue]
var current_line = -1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		current_line += 1
		if lines.size()>current_line:
			display(lines[current_line])


@onready var portrait = $Portrait
@onready var character_name = $Name
@onready var text = $Text

func display(line):
	portrait.texture = line.portrait
	character_name.text = line.character_name
	text.text = line.line
	
