extends CSGSphere3D

@export var points = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	body.update_score(points)
	print(body.score)
	print("somebody is here!")
	hide()
	$AudioStreamPlayer3D.play()
	


func _on_audio_stream_player_3d_finished():
	queue_free()
