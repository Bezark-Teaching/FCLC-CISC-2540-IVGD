extends Sprite2D

@export var speed = 4
var health = 100
var damage = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_pressed("move_down"):
			position.y += speed
	if Input.is_action_pressed("move_up"):
		position.y -= speed
	if Input.is_action_pressed("move_left"):
		position.x -= speed
	if Input.is_action_pressed("move_right"):
		position.x += speed
	
	if Input.is_action_just_pressed("jump"):
		position.y -= 50
	
	if Input.is_action_just_pressed("attack"):
		prints("take", damage, "damage!")
