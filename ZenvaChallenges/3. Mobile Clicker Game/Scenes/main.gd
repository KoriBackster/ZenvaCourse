extends Control

@onready var ScoreLabel : Label = $ScoreLabel
@onready var AimScoreLabel : Label = $AimScoreLabel
@onready var TimeRemainingLabel : Label = $TimeRemainingLabel

var score : int = 0

func _on_increase_button_pressed() -> void:
	score += 1
	ScoreLabel.text = "Score: " + str(score)
