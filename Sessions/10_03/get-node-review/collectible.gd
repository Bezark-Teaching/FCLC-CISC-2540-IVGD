extends Area2D

signal item_collected


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	print('you found me!!!')
	item_collected.emit()
	queue_free()
	pass # Replace with function body.
