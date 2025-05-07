extends Node

#region External Signals
## Buttons/Signals

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player_instance:
		_F__kill_player()
#endregion

#region On-Ready Sequence
## On-Ready Sequence

@onready var UI : Node = $UI

var player_count : int = 0
var player : PackedScene = load("res://ZenvaChallenges/4. TappyPlane/Scenes/player.tscn")
var player_instance : RigidBody2D
func _ready() -> void:
	
	_S__player_spawn()

	print_debug(get_tree().get_nodes_in_group("Player").size())
	

#endregion

#region Script Variables
#region Hard-coded
var formatted_score : String
var score : float
var health : float = 100.0

var spawned_objects_position_x = 1700
#endregion
#region Exports



@export var dynamic_objects_speed : float = 200.00
@export var health_decrease_speed : int = 3
@export var test_mode : bool = false


#endregion
#endregion

#region _Process
## Process Loop
func _process(delta: float) -> void:
	_S__death_check()
	
	_S__move_scene(delta)
	
#	_S__health_update(health, delta)
	
#	_S__score_update(delta)

	
#endregion

#region Sub-Scripts
## Sub-Scripts:

func _S__player_spawn():
	
	if player_count == 0:
		player_count += 1
		
		player_instance = player.instantiate()
		player_instance.add_to_group("Player")
		add_child(player_instance)
		player_instance.position.x = 200
		player_instance.position.y = 530
	else:
		print("Player already exists")

func _S__death_check():

	if !is_instance_valid(player_instance):
		dynamic_objects_speed = lerp(dynamic_objects_speed, 0.00, .05)

func _S__move_scene(delta):
	
	for dynamic_object in get_tree().get_nodes_in_group("DynamicObjects"):
		dynamic_object.position.x -= delta * dynamic_objects_speed

#
#func _S__health_update(current_health, delta):
#	
#	if health >= 0 and is_instance_valid(player_instance):
#		health -= delta * health_decrease_speed
#		if int(health) != int(current_health):
#			current_health = health
#			$UI/HealthBar/ScoreLabel.text = str(formatted_score)
#		$UI/HealthBar.value = health
#	else:
#		
#		_F__kill_player()

#func _S__score_update(delta):                           # /* Is Called in "_Process" function /* In "Scripts" region  !!
#	if isAlive:
#		score += delta * 3 # Rate of score change // Perpetual score change
#		formatted_score = str(score) # Setting the current score
#		var decimal_index = formatted_score.find(".") # Finding the decimal point and cutting it off -> could just covert to int instead
#		formatted_score = formatted_score.left(decimal_index) # Setting printed score to the score without the decimals
		#print_debug( str(decimal_index) + ": " + formatted_score ) # debug

#endregion

#region Base Functions
## Base Functions

func _F__kill_player():
	if is_instance_valid(player_instance):
		print("Player is dead")
		player_instance.queue_free()

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
