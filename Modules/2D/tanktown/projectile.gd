extends CharacterBody2D

class_name Projectile

var speed = 500
func _physics_process(delta: float) -> void:
	if get_slide_collision_count() > 0:
		$Sprite2D.play("explode")
	else:
		move_and_slide()
		#var collision = get_slide_collision(i)
		#print("Collided with: ", collision.get_collider().name)


func _on_sprite_2d_animation_finished() -> void:
	if $Sprite2D.animation == "explode":
		queue_free()
