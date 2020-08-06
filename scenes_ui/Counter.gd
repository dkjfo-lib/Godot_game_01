tool

extends TextureRect

onready var label_name := $"Label-name"
onready var label_count := $"Label-count"

export(String) var param_name setget set_param_name
func set_param_name(new_name: String):
	param_name = new_name
	if label_name != null: 
		label_name.text = param_name
		return
	if has_node("Label-name"): 
		$"Label-name".text = param_name

export(String) var param_value setget set_param_value
func set_param_value(new_value: String):
	param_value = new_value
	if label_count != null: 
		label_count.text = param_value
		return
	if has_node("Label-count"): 
		$"Label-count".text = param_value
