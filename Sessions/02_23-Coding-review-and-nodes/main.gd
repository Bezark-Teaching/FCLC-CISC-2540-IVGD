extends Node2D



func _on_icon_player_died() -> void:
	print('the game is over')
	#var level = get_node("Level")
	#level.hide()
	$Level/Block4.hide()
