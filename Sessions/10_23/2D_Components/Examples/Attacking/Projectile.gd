extends Sprite2D
@export var speed = 5.0
@export var damage_amount = 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed


func _on_area_2d_body_entered(body):
	body.damage(damage_amount)
	queue_free()
