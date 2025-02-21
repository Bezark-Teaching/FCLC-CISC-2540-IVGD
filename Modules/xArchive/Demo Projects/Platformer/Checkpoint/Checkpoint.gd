extends Node2D

var activated = false



func _on_area_2d_body_entered(body):
	if !activated:
		$AnimatedSprite2D.play("flag_out")
		body.respawn_point = self
		activated = true
	


func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.play("flag_idle")
