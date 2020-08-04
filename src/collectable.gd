extends Area2D

class_name collectable

export var score_value:= 10
export var fuel_value := 10000
export var destroy_self:= true

func _on_body_entered(body: Node) -> void:
	change_player_score()
	if destroy_self:
		destroy_self()

func change_player_score():
	print ("=========================================>")
	print ("add " + str(score_value) + " score points")
	print ("add " + str(fuel_value) + " fuel points")
	player_score.score += score_value

func destroy_self():
	queue_free()
	
