extends Node

signal player_boosting
signal player_spawn
signal player_killed

var player : PackedScene = preload("res://ZenvaChallenges/4. TappyPlane/Prefabs/player.tscn")

var player_instance : Player_Plane

func _ready() -> void:
		_F__spawn_player()


func _F__spawn_player():
	
	emit_signal("player_spawn")
	player_instance = player.instantiate()
	player_instance.add_to_group("Player")
	
	add_child(player_instance)
	
	player_instance.position.x = 200
	player_instance.position.y = 480
	
	return

func _F__kill_player():
	if is_instance_valid(player_instance):
		
		emit_signal("player_killed")
		player_instance.queue_free()

		return
