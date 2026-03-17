extends Sprite2D
@export var speed = 5.0
@export var damage_amount = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed


func _on_area_2d_body_entered(body):
	body.damage(damage_amount)
	queue_free()
