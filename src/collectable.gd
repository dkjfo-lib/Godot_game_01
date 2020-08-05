extends Area2D

class_name collectable

export var score_value:= 10
export var fuel_value := 1000 # ~3sec of burn
export var destroySelf:= true

func _on_body_entered(body: Node) -> void:
	change_player_score(body)
	if destroySelf:
		destroy_self()

func change_player_score(body: Node):
	print ("=========================================>")
	print ("add " + str(score_value) + " score points")
	print ("add " + str(fuel_value) + " fuel points")
	player_score.score += score_value
	body.fuel += fuel_value

func destroy_self():
	queue_free()
	
