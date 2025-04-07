extends Node3D
var score = 0
@export var ScoreUI : Label

func _on_balloon_manager_pop() -> void:
	score += 1
	update_score()

func update_score():
	var init_text = "Score: %s"
	ScoreUI.text = init_text % score


func _on_button_pressed() -> void:
	pass
