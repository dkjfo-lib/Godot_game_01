extends Node2D

class_name AttractingBody

const gravConstant: = 10000
export var acceleration: = 40

func get_grav(otherBody: Node2D, delta: float) -> Vector2:
	var dir2Body = position.direction_to(otherBody.position)
	var dist2Body = position - otherBody.position
	return -dir2Body * delta * acceleration / dist2Body.length_squared() * gravConstant
