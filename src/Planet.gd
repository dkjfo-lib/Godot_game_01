tool

extends AttractingBody

class_name Planet


export(Color, RGB) var color: = Color.white setget set_color
func set_color(new_color):
	color = new_color
	change_color()
	
export(int, 5, 20, 5) var radius: = 5 setget set_radius
func set_radius(new_radius):
	radius = new_radius
	scale = Vector2.ONE * radius
	
export(int, 5, 30, 1) var atmospheric_radius: = 0  setget set_atmospheric_radius
func set_atmospheric_radius(new_radius):
	atmospheric_radius = new_radius
	if has_node("GasCloud"):
		get_node("GasCloud").radius = atmospheric_radius
	
export(int, 0, 100, 10) var atmospheric_density: = 0  setget set_atmospheric_density
func set_atmospheric_density(new_density):
	atmospheric_density = new_density
	get_node("GasCloud").density = atmospheric_density
	
export(Color, RGB) var atmospheric_color: = Color.white setget set_atmospheric_color
func set_atmospheric_color(new_color):
	atmospheric_color = new_color
	if has_node("GasCloud"):
		get_node("GasCloud").color = new_color
	
func change_color():
	if has_node("planet_sprite"):
		get_node("planet_sprite").self_modulate = Color(color.r, color.g, color.b, 1)
	pass
