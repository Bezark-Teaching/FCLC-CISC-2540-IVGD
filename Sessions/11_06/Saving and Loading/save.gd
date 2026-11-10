extends Button

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var data = load_from_file()
	$Score.text = data
	var score_string = data.get_slice(" ", 1)
	score = int(score_string)
	print(score)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_down() -> void:
	print('saving!!')
	save_to_file($Score.text)

func save_to_file(content):
	var file = FileAccess.open("user://save_cool_fun.txt", FileAccess.WRITE)
	file.store_string(content)

func load_from_file():
	var file = FileAccess.open("user://save_cool_fun.txt", FileAccess.READ)
	var content = file.get_as_text()
	return content


func _on_increase_score_button_down() -> void:
	score += 1
	$Score.text = str('score- ', score)
