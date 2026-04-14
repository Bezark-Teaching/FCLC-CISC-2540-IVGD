extends Item
class_name Weapon

@export var damage := 5


func attack():
	print('I do ',damage, 'damage!')
