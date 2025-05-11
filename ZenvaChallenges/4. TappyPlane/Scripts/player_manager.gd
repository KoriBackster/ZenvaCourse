extends Node

var player_count : int = 0

var player : PackedScene = load("res://ZenvaChallenges/4. TappyPlane/Scenes/player.tscn")

var player_instance : RigidBody2D 

func _ready() -> void:
	if player_count == 0:
		_S__player_spawn(player_count)

		print_debug(get_tree().get_nodes_in_group("Player").size())
	else:
		print("Player already exists")
		return


func _S__player_spawn(count):
	player_count += 1
	
	player_instance = player.instantiate()
	player_instance.add_to_group("Player")
	add_child(player_instance)
	player_instance.position.x = 200
	player_instance.position.y = 530
	print("hello")
	return

func _F__kill_player():
	if is_instance_valid(player_instance):
		print("Player is dead")
		player_count -= 1
		player_instance.queue_free()
		return
