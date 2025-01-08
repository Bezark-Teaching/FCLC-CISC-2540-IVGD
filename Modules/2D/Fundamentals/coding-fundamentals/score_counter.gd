extends Node2D

var score = 0


func _process(delta):
	if score == 10:
		print("You win!")
	else:
		print(score)
		score +=1
