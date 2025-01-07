extends Sprite2D
signal counter_max_reached
signal scored_a_point


var counter = 0 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("scored_a_point")
	
	counter +=1
	if counter > 50:
		emit_signal("counter_max_reached")
		counter = 0
	
