extends KinematicBody2D

class_name AttractedBody

export var path_to_gravityCenter: NodePath
onready var gravityCenter : AttractingBody = get_node(path_to_gravityCenter)

var _velocity: = Vector2.ZERO

func _physics_process(delta: float) -> void:
	my_physics_process(delta)
	
func my_physics_process(delta: float) -> void:
	if gravityCenter != null:
		var normal = position.direction_to(gravityCenter.position)
		var gravity = getVelocity_Gravity(delta)
		rotation = position.angle_to_point(gravityCenter.position)+PI/2
		_velocity = move_and_slide(gravity + _velocity, normal)
	
	
	
func getVelocity_Gravity(delta: float) -> Vector2:
		var gravityAxis = position.direction_to(gravityCenter.position)
		return gravityCenter.acceleration * delta * gravityAxis
	
