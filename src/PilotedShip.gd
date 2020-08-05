extends aerodinamicBody

class_name PilotedShip

export var speed: = 100
export var max_fuel: = 10000
export(float, 0, 10000, 1000) var fuel: = 10000.0 setget set_fuel, get_fuel # ~30sec
func set_fuel(value: float) -> void:
	fuel = value
	if fuel > max_fuel: fuel = max_fuel
func get_fuel() -> float:
	return fuel

func my_physics_process(delta: float) -> void:
	var normal = Vector2.UP
	var add_velocity = Vector2.ZERO
	var gravity: = get_result_gravity(delta)
	add_velocity += gravity
	add_velocity += getVelocity_Input_EngineWork(delta)
	move_in_atmosphere(add_velocity, gravity)
	if _velocity.length_squared() > 1:
		rotation = position.angle_to_point(position + _velocity) + PI

func getVelocity_Input_EngineWork(delta: float) -> Vector2:
	if fuel < 0: return Vector2.ZERO 
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
