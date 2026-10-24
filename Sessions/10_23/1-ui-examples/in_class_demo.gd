extends Control


func _on_start_button_down() -> void:
	print('you pressed me!')
	get_tree().change_scene_to_file("res://level1.tscn")


func _on_tutorial_button_down() -> void:
	$Main.hide()
	$HowtoPlay.show()


func _on_back_button_down() -> void:
	$Main.show()
	$HowtoPlay.hide()
