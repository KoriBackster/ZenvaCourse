extends Node

#region External Signals
## Buttons/Signal
func _ready() -> void:
	$UI/DeathUI.modulate.a =  0.0

@onready var start_text : Label = get_node("UI").get_node("StartText")
@onready var RemainingTime : Label = get_node("UI").get_node("StartText").get_node("RemainingStartTimeDisplay")
@onready var start_timer : Timer = get_node("UI").get_node("StartText").get_node("StartTimer")
var currentTime : int = 2
func _on_start_timer_timeout() -> void:
	if currentTime > -1:
		RemainingTime.text = str((currentTime)) + "(s)"
		currentTime -= 1
		if currentTime == -1:
			RemainingTime.queue_free()
		return
	elif currentTime == -1:
		start_timer.stop()
		start_timer.queue_free()
		start_text.queue_free()
		return

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		PlayerManager._F__kill_player()
#endregion

#region On-Ready Sequence
## On-Ready Sequence

@onready var PlayerManager : Node = $%PlayerManager
@onready var UI : Node = get_node("UI")

#endregion

#region Script Variables
#region Hard-coded
var formatted_score : String
var score : float
var health : float = 100.0
var is_alive : bool = true
var boosting : bool = false
#endregion
#region Exports



@export var dynamic_objects_speed : float = 200.00
@export var health_decrease_speed : int = 3
@export var TEST_MODE : bool = false


#endregion
#endregion

#region _Process
## Process Loop
func _process(delta: float) -> void:
	
	_S__move_scene(delta)
	
	if not is_instance_valid(start_text):
		_S__health_update(health, delta)
	
		_S__score_update(delta)

	
#endregion

#region Sub-Scripts
## Sub-Scripts:
		

func _S__move_scene(delta):
	if !is_alive:
		dynamic_objects_speed = lerp(dynamic_objects_speed, 0.00, .01)
	
	for dynamic_object in get_tree().get_nodes_in_group("DynamicObjects"):
		dynamic_object.position.x -= delta * dynamic_objects_speed



#
func _S__health_update(current_health, delta):
	
	if health >= 0 and is_alive:
		health -= delta * health_decrease_speed
		if int(health) != int(current_health):
			current_health = health
			$UI/HealthBar/ScoreLabel.text = str(formatted_score)
		$UI/HealthBar.value = health
		return
	elif health <= 0 and is_alive:
		is_alive = false
		PlayerManager._F__kill_player()
		return
	else:
		$UI/HealthBar.value = 0
		$UI/HealthBar/ScoreLabel.text = str(formatted_score)
		return

func _S__score_update(delta):                           # /* Is Called in "_Process" function /* In "Scripts" region  !!
	if is_alive:
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
var health_decrease_buffer := health_decrease_speed

func _physics_process(delta: float) -> void:
	
	if boosting:
		health_decrease_speed = health_decrease_buffer * 2
		
	if Input.is_action_just_released("Click"):
		boosting = false
		health_decrease_speed = health_decrease_buffer
		return


func _on_player_manager_child_exiting_tree(node: Node) -> void:
	is_alive = false
	return


func _on_coin_collected() -> void:
	health += 10.0
	if health > 100.0:
		health = 100.0


func _on_boosting() -> void:
	boosting = true


func _on_player_spawn() -> void:
	var s_timer : Timer = $UI/StartText/StartTimer
	s_timer.start()


func _on_end_cycle_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://ZenvaChallenges/4. TappyPlane/Scenes/menu.tscn")
