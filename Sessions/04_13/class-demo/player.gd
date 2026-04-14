extends Node2D

@export var held_item : Item

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if held_item:
			if held_item is Weapon:
				held_item.attack()
			else:
				print('i am holding a ', held_item.title)
