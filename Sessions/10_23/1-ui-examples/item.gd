extends Node2D

@export var value = 1


func _on_area_2d_body_entered(body):
	print(body)
	#hide()
	#$AudioStreamPlayer2D.play()
	#body.my_cool_function()
	body.change_score(value)
	queue_free()


func _on_audio_stream_player_2d_finished() -> void:
	queue_free()
