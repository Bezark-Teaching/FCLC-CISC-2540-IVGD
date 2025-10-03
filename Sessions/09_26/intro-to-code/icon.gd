extends Sprite2D

@export var speed = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print('im ready')
	var is_pos_over_800 = position.x > 800
	
	if is_pos_over_800:
		print('my position is over 800')



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_pressed("ui_up"):
		position.y -= speed
	if Input.is_action_pressed("ui_down"):
		position.y += speed
	if Input.is_action_pressed("ui_left"):
		position.x -= speed
	if Input.is_action_pressed("ui_right"):
		position.x += speed

	
	#position.x = position.x + speed
	#position.y += speed
	#if position.x > 800:
		#print('i win!')
	#else:
		#print('still racing, position is ', position.x)
