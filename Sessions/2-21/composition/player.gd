extends Sprite2D

@export var speed = 4
var health = 100
var damage = 50
var is_jumping = false
var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text =str(score)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if is_jumping:
		position.y -= 1
	
	if Input.is_action_pressed("move_down"):
			position.y += speed
	if Input.is_action_pressed("move_up"):
		position.y -= speed
	if Input.is_action_pressed("move_left"):
		position.x -= speed
	if Input.is_action_pressed("move_right"):
		position.x += speed
	
	if Input.is_action_just_pressed("jump"):
		is_jumping = true
		$Timer.start()
	
	if Input.is_action_just_pressed("attack"):
		prints("take", damage, "damage!")


func _on_timer_timeout():
	print("done jumping")
	is_jumping = false


func _on_area_2d_area_entered(area):
	print("score increased")
	score += 1
	$Label.text =str(score)
