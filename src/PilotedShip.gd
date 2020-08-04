extends AttractedBody

class_name PilotedShip

export var speed: = 100
export var fuel: = 10000000

func _physics_process(delta: float) -> void:
	my_physics_process(delta)
	
func my_physics_process(delta: float) -> void:
	var normal = Vector2.UP
	var add_velocity = Vector2.ZERO
	if gravityCenter != null:
		normal = position.direction_to(gravityCenter.position)
		add_velocity += getVelocity_Gravity(delta)
	add_velocity += getVelocity_Input_EngineWork(delta)
	_velocity = move_and_slide(add_velocity + 1 * _velocity, normal)
	if _velocity!=Vector2.ZERO:
		rotation = position.angle_to_point(position + _velocity) + PI

func getVelocity_Input_EngineWork(delta: float) -> Vector2:
	if fuel < 0:
		return Vector2.ZERO 
	var engine_vel:= getVelocity_Input(delta)
	fuel -= engine_vel.length_squared()
	return engine_vel
	
func getVelocity_Input(delta: float) -> Vector2:
	var input = getDirection().rotated(rotation).normalized()
	return input * delta * speed

func getDirection() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right")-Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down")-Input.get_action_strength("move_up"))
