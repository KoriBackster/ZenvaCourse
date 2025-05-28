extends Node

func _ready():
	var scene = preload("res://ZenvaChallenges/5. Walking Sim/Scenes/walking_sim.tscn")
	get_node("3D Game").add_child(scene)

func _on_game_state_manager_change_scene(scene_path:String, game_type:int) -> void:

	var scene = preload(scene_path)

	#// Remove the previous scene
	if is_instance_valid(get_node("3D Game").get_child(0)):
		get_node("3D Game").get_child(0).queue_free()
	
	if is_instance_valid(get_node("2D Game").get_child(0)):
		get_node("2D Game").get_child(0).queue_free()
	
	#// Add the new scene
	if game_type == 1:
		#// This is a 3D game
		get_node("3D Game").add_child(scene)
		return

	elif game_type == 2:
		#// This is a 2D game
		get_node("2D Game").add_child(scene)
		return
	
	elif game_type == 0:
		
		get_tree().quit()
		return
