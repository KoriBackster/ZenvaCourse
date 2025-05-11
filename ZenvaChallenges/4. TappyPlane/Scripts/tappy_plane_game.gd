extends Node

#region External Signals
## Buttons/Signals

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == PlayerManager.player_instance:
		PlayerManager._F__kill_player()
#endregion

#region On-Ready Sequence
## On-Ready Sequence

@onready var UI : Node = $UI

#endregion

#region Script Variables
#region Hard-coded
var formatted_score : String
var score : float
var health : float = 100.0


#endregion
#region Exports



@export var dynamic_objects_speed : float = 200.00
@export var health_decrease_speed : int = 3



#endregion
#endregion

#region _Process
## Process Loop
func _process(delta: float) -> void:
	_S__death_check()
	
	_S__move_scene(delta)
	
	_S__health_update(health, delta)
	
	_S__score_update(delta)

	
#endregion

#region Sub-Scripts
## Sub-Scripts:




func _S__death_check():

	if !is_instance_valid(PlayerManager.player_instance):
		dynamic_objects_speed = lerp(dynamic_objects_speed, 0.00, .05)

func _S__move_scene(delta):
	
	for dynamic_object in get_tree().get_nodes_in_group("DynamicObjects"):
		dynamic_object.position.x -= delta * dynamic_objects_speed

#
func _S__health_update(current_health, delta):
	
	if health >= 0 and is_instance_valid(PlayerManager.player_instance):
		health -= delta * health_decrease_speed
		if int(health) != int(current_health):
			current_health = health
			$UI/HealthBar/ScoreLabel.text = str(formatted_score)
		$UI/HealthBar.value = health
	else:
		
		PlayerManager._F__kill_player()

func _S__score_update(delta):                           # /* Is Called in "_Process" function /* In "Scripts" region  !!
	if PlayerManager.player_count == 1:
		score += delta * 3 # Rate of score change // Perpetual score change
		formatted_score = str(score) # Setting the current score
		var decimal_index = formatted_score.find(".") # Finding the decimal point and cutting it off -> could just covert to int instead
		formatted_score = formatted_score.left(decimal_index) # Setting printed score to the score without the decimals
		#print_debug( str(decimal_index) + ": " + formatted_score ) # debug

#endregion

#region Base Functions
## Base Functions



#endregion

##region Test Bench
#var score : float      # /* Called in "_S__score_update()" function  /* In "Variable" Region !!
#
#func _S__score_update(delta):                           # /* Is Called in "_Process" function /* In "Scripts" region  !!
	#if isAlive:
		#score += delta
		#var formatted_score : String = str(score)
		#var decimal_index = formatted_score.find(".")
		#
		#print(decimal_index)
#
#
##endregion
