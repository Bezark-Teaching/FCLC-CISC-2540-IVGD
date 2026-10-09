extends AnimatedSprite2D

var nearby_body
@export var fake = false
## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.timeout.connect(time_up)
	#play("on")
	#


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("ui_accept"):


func time_up():
	print('kaboom!')
	play("explode")
	if nearby_body:
		nearby_body.modulate = Color.RED


func _on_animation_finished() -> void:
	print(animation)
	if animation == 'dud':
		play('default')
	elif animation == 'explode':
	##hide()
		queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	nearby_body = area.get_parent()
	print(area)
	
	if fake:
		play('dud')
	else:
		var timer = get_node("Timer")
		timer.start()
		play("on")


func _on_area_2d_area_exited(area: Area2D) -> void:
	nearby_body = null
