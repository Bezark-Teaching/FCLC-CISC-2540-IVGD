extends Node2D

func _ready():
	$Sprite.frame = randi_range(0,16)

func _on_area_2d_body_entered(body):
	$Sprite.play("collected")
	$SoundEffect.play()

func _on_sprite_animation_finished():
	queue_free()
