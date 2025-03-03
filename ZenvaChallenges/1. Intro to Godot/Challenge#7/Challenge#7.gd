extends Node2D


var has_won : bool = false
var current_score : int
var timer : float = 0.0

var MAX_SCORE : int = 10000 + luck_factor
var START_CHANCE : int = 5
var luck_factor : int = 0
@onready var win_chance : int = START_CHANCE
@onready var label = $Label

func _ready():
	pass
	

func _process(delta: float) -> void:
	current_score = randi_range(0, MAX_SCORE)
	luck_factor = clampi(luck_factor, 0, win_chance)	
	label.text = ("timer: " + str(int(timer)) + "Win Chance: " + str(win_chance) + "Luck Factor: " + str(luck_factor))
	
	_has_won(current_score)
	_winCheck(delta)
	
	

func _has_won(score):
	if score >= MAX_SCORE - win_chance:
		print("!!!")
		if score >= MAX_SCORE - luck_factor:
			print("Youre LUCKY!")
		has_won = true
	else:
		has_won = false

func _winCheck(delta):
	
	if has_won == false:
		timer += 1.0 * delta
	else:
		print('You won!')
		print(timer)
		print("$$$")
		
		win_chance += 3
		luck_factor += 1
		win_chance %= 54
		if win_chance == 0:
			win_chance = luck_factor + 3
		
		has_won = false
		timer = 0.0
	return