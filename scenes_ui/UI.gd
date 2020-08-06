extends CanvasLayer

onready var counter_FPS:= $"VBoxContainer/FPS Counter"
onready var counter_fuel:= $"VBoxContainer/Fuel Counter"
onready var counter_score:= $"VBoxContainer/Score Counter"


func _ready() -> void:
	player_score.connect("score_updated", self, "on_score_changed")
	counter_score.param_value = "0"

func on_score_changed(value: int) -> void: 
	counter_score.param_value = str(player_score.score)


func _process(delta: float) -> void:
	counter_FPS.param_value = str(Performance.get_monitor(0))
