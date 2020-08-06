extends Node

signal score_updated
signal fuel_updated

var score: = 0 setget set_score
func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated", value)

var fuel: = 0 setget set_fuel
func set_fuel(value: int) -> void:
	fuel = value
	emit_signal("fuel_updated", value)

func reset() -> void:
	score = 0
	fuel = 0
	
