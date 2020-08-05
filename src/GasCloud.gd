tool

extends Area2D

class_name GasCloud

export(Color, RGB) var color: = Color.white setget set_color
func set_color(new_color):
	color = new_color
	change_color()

export(int, 5, 150, 5) var radius: = 1 setget set_radius
func set_radius(new_radius):
	radius = new_radius
	scale = Vector2.ONE * radius
	
export(int, 0, 100, 10) var density: int = 20 setget set_density
func set_density(new_density):
	density = new_density
	change_color()

func change_color():
	if has_node("gas_sprite"):
		get_node("gas_sprite").self_modulate = Color(color.r, color.g, color.b, density/100.0)
	pass


func _on_GasCloud_entered(aero_body: Node2D) -> void:
	if aero_body is aerodinamicBody:
		aero_body.aerodinamic_resistance = density

func _on_GasCloud_exited(aero_body: Node2D) -> void:
	if aero_body is aerodinamicBody:
		aero_body.aerodinamic_resistance = 0
