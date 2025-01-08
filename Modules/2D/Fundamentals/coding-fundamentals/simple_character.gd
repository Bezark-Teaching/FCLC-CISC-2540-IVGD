extends Sprite2D

@export var speed = 2.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_pressed("ui_down"):
		#position.y += 1
	if Input.is_action_pressed("down"):
		position.y += speed
	
	if Input.is_action_pressed("up"):
		position.y -= speed
	
	if Input.is_action_pressed("left"):
		position.x -= speed

	if Input.is_action_pressed("right"):
		position.x += speed
	if Input.is_action_just_pressed("jump"):
		print("jumped!")
