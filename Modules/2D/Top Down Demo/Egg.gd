extends Node2D


func _on_area_2d_body_entered(body):
	$Sprite.play("collected")


func _on_sprite_animation_finished():
	queue_free()
	#hide()
