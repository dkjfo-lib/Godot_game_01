extends AttractedBody

class_name aerodinamicBody

export(float, 0, 1, .1) var aerodinamic_coefficient = .5
export var aerodinamic_resistance: float = 0
	
func my_physics_process(delta: float) -> void:
	if gravBodies.size() == 0: return
	var gravForce: = get_result_gravity(delta)
	rotation = position.angle_to_point(position + gravForce)+PI/2
	move_in_atmosphere(gravForce, gravForce)

func move_in_atmosphere(addVelocity: Vector2, gravForce: Vector2):
	_velocity = get_resistance() * move_and_slide(addVelocity + _velocity, -gravForce)
	
func get_resistance() -> float:
	return 1 - (aerodinamic_resistance * aerodinamic_coefficient)/5000.0
