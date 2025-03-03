extends Node2D

signal level_up

var current_score
@onready var label = $"../Label"


func _ready() -> void:
	current_score = 0

func _process(delta: float) -> void:
	label.text = "Score: " + str(current_score)
	if current_score == 10:
		current_score = 0
		level_up.emit()

func _on_balloon_manager_pop() -> void:
	current_score += 1
