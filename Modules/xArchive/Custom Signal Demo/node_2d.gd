extends Node2D

# You can connect a node to signals from any other node.

#The two functions below are connected to the Sender node. CLick on the green arrow to verify.

func _on_icon_counter_max_reached():
	print("the counter is done")

var score = 0
func _on_icon_scored_a_point():
	score += 1
	print(score)
