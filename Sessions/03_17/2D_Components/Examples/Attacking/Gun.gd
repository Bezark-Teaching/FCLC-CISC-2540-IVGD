extends Node2D

const PROJECTILE = preload("res://Examples/Attacking/Projectile.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var new_bullet = PROJECTILE.instantiate()
	new_bullet.position = $Marker.position
	add_child(new_bullet)
