extends Node2D
class_name Item

@export var item_name : String

@export var image : Texture2D

@export var value = 0
@export var rarity = "common"
@export var class_type : String

var picked_up : bool = false


func sell():
	prints('you sold', item_name, "for", value)
