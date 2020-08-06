extends KinematicBody2D

class_name AttractedBody

var gravBodies: = Array()

func _ready() -> void:
	gravBodies = get_node("../gravBodies").get_children()

var _velocity: = Vector2.ZERO

func _physics_process(delta: float) -> void:
	my_physics_process(delta)
	
func my_physics_process(delta: float) -> void:
	if gravBodies.size() == 0: return
	var gravForce: = get_result_gravity(delta)
	rotation = position.angle_to_point(position + gravForce)+PI/2
	_velocity = move_and_slide(gravForce + _velocity, -gravForce)
	
	
func get_result_gravity(delta: float) -> Vector2:
	var gravForce: = Vector2.ZERO
	for gravBody in gravBodies:
		gravForce += gravBody.get_grav(self, delta)
	return gravForce
