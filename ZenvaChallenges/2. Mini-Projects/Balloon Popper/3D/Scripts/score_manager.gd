extends Node3D
var score = 0
var level = 0
@export var ScoreUI : Label

func _on_balloon_manager_pop() -> void:
	score += 1
	update_score()

func update_score():
	var init_text = "Score: %s"
	ScoreUI.text = init_text % level

func _process(delta: float) -> void:
	
	if score >= 100:
		level += 1
		score -= 100
	


func _on_button_pressed() -> void:
	level = 0
