extends Node2D

const PROJECTILE = preload("res://Examples/Attacking/Projectile.tscn")



func _on_timer_timeout():
	var new_bullet = PROJECTILE.instantiate()
	new_bullet.position = $Marker.position
	add_child(new_bullet)
