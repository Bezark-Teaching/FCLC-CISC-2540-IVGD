extends Node

const ENEMY = preload("res://enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for x in 10:
		var new_enemy = ENEMY.instantiate()
		new_enemy.position.y = x*10
		add_child(new_enemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
