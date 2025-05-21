class_name PlayerController
extends CharacterBody3D

@export_group("Movement")
@export var max_speeed : float = 4.0
@export var acceleration : float = 20.0
@export var deceleration : float = 20.0
@export var air_acceleration : float = 4.0
@export var jump_force : float = 5.0
@export var gravity_modifier : float = 1.0
@export var max_run_speed : float = 6.0

var is_running : bool = false
var is_falling : bool = false

@export_group("Camera")
@export var look_sensitivity : float = 0.005
var camera_look_input : Vector2


@onready var camera : Camera3D = get_node("Camera3D")
@onready var head : Node3D = get_node("Head")
@onready var gravity : float = ProjectSettings.get_setting("physics/3d/default_gravity") * gravity_modifier

func _ready():
	pass

func _unhandled_input(event: InputEvent) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass