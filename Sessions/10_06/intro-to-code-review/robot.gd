extends Sprite2D

var number = 0
@export var speed = 2

@export var health = 250

# Called when the node enters the scene tree for the first time.
func _ready():
	print(position.y)
	position.y += 100
	
	if 1+12 < 2:
		print("a big number")
	else:
		print("a little number")
		
	print(position.y)


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	
	if Input.is_action_just_pressed("Jump"):
		print("i jumped")
	
	if Input.is_action_just_pressed("move_right"):
		position.x += speed
	#if Input.is_action_pressed("ui_left"):
		#position.x -= speed
#
	#if Input.is_action_pressed("ui_right"):
		#position.x += speed
	#if Input.is_action_pressed("ui_up"):
		#position.y -= speed
	#
	#if Input.is_action_pressed("ui_down"):
		#position.y += speed
	##
	#
	#
	#if Input.is_key_pressed(KEY_D):
		#position.x += speed
	#if Input.is_key_pressed(KEY_A):
		#position.x -= speed
		#
	#if Input.is_key_pressed(KEY_S):
		#position.y += speed
	#if Input.is_key_pressed(KEY_W):
		#position.y -= speed
	#
	
	#health -= 1
	#print(health)
	#
	#if health <= 0:
		#visible = false

	#move()
	#attack()
	#heal()


func move():
	position.x +=  speed


func attack():
	print('wack!')
	modulate = Color.RED

func heal():
	modulate = Color.BLUE
	
