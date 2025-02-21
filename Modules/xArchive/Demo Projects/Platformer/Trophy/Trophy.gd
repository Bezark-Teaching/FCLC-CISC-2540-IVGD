extends Node2D

@onready var transition_sprite = $TransitionSprite



func _on_area_2d_body_entered(body):
	$AnimatedSprite2D.play("ending")


func _on_animated_sprite_2d_animation_finished():
	transition_sprite.show()
	var tween = get_tree().create_tween()
	tween.tween_property(transition_sprite, "scale:x", 30., 2.0)
	tween.parallel().tween_property(transition_sprite, "scale:y", 30., 2.0)
#	tween.tween_callback(self.queue_free)

