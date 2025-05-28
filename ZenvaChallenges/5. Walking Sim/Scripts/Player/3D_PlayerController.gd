class_name PlayerController
extends CharacterBody3D

@export_group("Movement")
@export var max_speed : float = 4.0
@export var acceleration : float = 20.0
@export var deceleration : float = 20.0
@export var air_acceleration : float = 4.0
@export var jump_force : float = 5.0
@export var gravity_modifier : float = 1.0
@export var max_run_speed : float = 6.0

var	is_running : bool = false

@export_group("Camera")
@export var look_sensitivity : float = 0.005
var camera_look_input : Vector2



@onready var head : Node3D = get_node("Head")
@onready var camera : Camera3D = head.get_node("Camera")
@onready var gravity : float = ProjectSettings.get_setting("physics/3d/default_gravity") * gravity_modifier

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	# Collects mouse movement input
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		camera_look_input = event.relative * -1 # takes the mouse movement and inverts it; this is used to look around
	# Collects keyboard input
	if event is InputEventKey:
		if event.is_action_pressed("Sprint"):
			is_running = true
		elif event.is_action_released("Sprint"):
			is_running = false


var target_speed : float = 0.0
func _physics_process(delta: float) -> void:

	# Handle gravity
	
	if is_on_floor():
		velocity.y = 0
	else:
		velocity.y -= gravity * delta

	# Handle jump
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_force

	# Handle movement direction
	
	var input_vector = Input.get_vector("Left", "Right", "Up_Forward", "Down_Backward")

	var move_dir = (transform.basis * Vector3(input_vector.x, 0, input_vector.y)).normalized()

	# Handle desired base max speed

	target_speed = max_run_speed if is_running else max_speed

	# Alter base max speed based on movement direction

	if input_vector.x != 0:
		target_speed = target_speed * 0.85 # slow down when moving sideways
	if input_vector.y <= 1 and input_vector.y > 0:
		target_speed = target_speed * 0.65 # slow down when moving backward


	# Handle desired acceleration

	var acceleration_rate = 0.0

	if is_on_floor():
		acceleration_rate = acceleration
	elif move_dir == Vector3.ZERO:
		acceleration_rate = deceleration
	elif not is_on_floor():
		acceleration_rate = air_acceleration
	
	# Set velocity

	var target_velocity = move_dir * target_speed

	velocity.x = lerp(velocity.x, target_velocity.x, acceleration_rate * delta)
	velocity.z = lerp(velocity.z, target_velocity.z, acceleration_rate * delta)

	# Enable movement

	move_and_slide()

	# Handle camera look
	
	rotate_y(camera_look_input.x * look_sensitivity) # rotates the player* around the Y axis
	head.rotate_x(camera_look_input.y * look_sensitivity) # rotates the player's head* around the X axis (has camera as child)
	head.rotation.x = clamp(head.rotation.x, -1.5, 1.5) # clamp the rotation to prevent flipping
	camera_look_input = Vector2.ZERO # reset the camera look input to zero after applying it; stops when the mouse is released

	

# Notes:

# velocity = Vector3.FORWARD # moves in one direction -> RIGHT, LEFT, BACKWARD, UP, DOWN, FORWARD
# velocity = Vector3.ZERO # cancels the instance's velocity
# camera_look_input = event.relative # add the mouse movement to the camera look input
# move_and_slide(0) # enables movement
# rotate_y(3) # rotates the instance around the Y axis -> _x, _y, _z
# Input.get_vector(4) # creates a vector with the given inputs *Vector2(x,y) -> "Left", "Right", "Up_Forward", "Down_Backward" = ((-1,0), (1,0), (0,1), (0,-1)) 
# velocity = Vector3(input_vector.x, 0, input_vector.y) * max_speed # moves the instance in the direction of the input vector, ignores camera orientation
# var move_dir = (transform.basis * Vector3(input_vector.x, 0, input_vector.y)).normalized() # sets the direction of movement based on instance's orientation, "transform.basis" is the instance's orientation in 3D space, "normalized()" makes the vector length 1
# velocity = move_dir * max_speed # multiplies the "normalized" direction by the max speed, to get the player's constant speed
