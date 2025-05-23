extends Node

#region External Signals
## Buttons/Signal

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
var game_running : bool = false

#endregion
#endregion

#region _Process
## Process Loop
func _process(delta: float) -> void:
	
	_S__move_scene(delta)

	if game_running:
		_S__health_update(health, delta)
	
		_S__score_update(delta)

	
#endregion

#region Sub-Scripts
## Sub-Scripts:
		

func _S__move_scene(delta):	
	
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
	$CoinManager/CoinCollectAudio.playing = true
	health += 10.0
	if health > 100.0:
		health = 100.0


func _on_boosting() -> void:
	boosting = true


func _on_end_cycle_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://ZenvaChallenges/4. TappyPlane/Scenes/menu.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		get_tree().paused = !get_tree().paused
		
		$UI/Continue.disabled = !get_tree().paused
		$UI/Continue.visible = get_tree().paused
		$UI/Quit.disabled = !get_tree().paused
		$UI/Quit.visible = get_tree().paused
		return

	


func _on_continue_pressed() -> void:
	get_tree().paused = false
	$UI/Continue.disabled = true
	$UI/Continue.visible = false
	$UI/Quit.disabled = true
	$UI/Quit.visible = false
	return


func _on_start_ui_tree_exiting() -> void:
	game_running = true


func _on_ui_start_game() -> void:
	$PlayerManager._F__enable_gravity()
