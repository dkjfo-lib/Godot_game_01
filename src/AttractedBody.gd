extends KinematicBody2D

class_name AttractedBody

export var path_to_gravityCenter: NodePath
onready var gravityCenter : AttractingBody = get_node(path_to_gravityCenter)

export var speed: = 5
var _velocity: = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var normal = Vector2.UP
	var add_velocity = Vector2.ZERO
	if gravityCenter != null:
		normal = position.direction_to(gravityCenter.position)
		add_velocity += gravityCenter.acceleration * delta * normal
		rotation = position.angle_to_point(gravityCenter.position)+PI/2
	var input = getDirection().rotated(rotation).normalized()
	add_velocity += input * delta * speed
	_velocity = move_and_slide(add_velocity + _velocity, normal)

func getDirection() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right")-Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down")-Input.get_action_strength("move_up"))
