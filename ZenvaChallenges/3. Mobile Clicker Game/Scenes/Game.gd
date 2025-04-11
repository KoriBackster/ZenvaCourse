extends Control

@onready var uiScore : Label = $ScoreLabel
@onready var uiOverflow : Label = $OverflowLabel
@onready var uiAimScore : Label = $AimScoreLabel
@onready var uiTimeRemaining : Label = $TimeRemainingLabel
@onready var uiReaction : Label = $ReactionLabel

@onready var ui_bIncrease : Button = $IncreaseButton

@onready var tTimer : Timer = $Timer

var score : int = 0
var AimScore : int = 50
var gameStart : bool = false

var overflowCounter : int = 0
var overflow_toggle : bool = false

var green = Color.html("00e300")
var red = Color.html("ff292a")

@export var COUNTDOWN : int
@export var aimScoreMultiplier : float = 5.0

var timeRemaining

func _ready():
	timeRemaining = COUNTDOWN
	var difficultyMin = (COUNTDOWN * aimScoreMultiplier)
	var difficultyMax = (difficultyMin) * 1.16
	AimScore = randi_range(difficultyMin, difficultyMax)
	uiTimeRemaining.text = "Time for challenge: " + str(COUNTDOWN) + " (s)"
	uiAimScore.text = "Aim Score: " + str(AimScore)

func _on_increase_button_pressed() -> void:
	if gameStart:
		score += 1
		uiScore.text = "Score: " + str(score)
		Input.vibrate_handheld(125)
		#uiScore.scale -= Vector2(5,5)
		if overflow_toggle:
			overflowCounter += 1
			uiOverflow.text = "Super clicks = " + str(overflowCounter)
			return
		if score == AimScore:
			overflow_toggle = true
		return
	else:
		gameStart = true
		tTimer.start()
		ui_bIncrease.text = "Click for points!"
		return
	#print_debug(get_tree_string_pretty())


func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")



func _on_timer_timeout() -> void:
	if timeRemaining > 0:
		timerTick()
		if timeRemaining == 0:
			endGame()
		return

func endGame():
	
	tTimer.one_shot = true
	ui_bIncrease.disabled = true
	ui_bIncrease.text = "Game Over."
	
	if score >= AimScore:
		uiReaction.add_theme_color_override(&"font_color", green)
		uiReaction.text = "You  Win!"
		print_debug(overflowCounter)
	else:
		uiReaction.add_theme_color_override(&"font_color", red)
		uiReaction.text = "You  Lose..."
	return

func timerTick():
	timeRemaining -= 1
	uiTimeRemaining.text = "Time Remaining: " + str(timeRemaining) + " (s)"
	return
