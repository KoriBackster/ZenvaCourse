extends Sprite2D

const VIEWPORT_SIZE = Vector2(540, 960)
const OFFSET = Vector2(80, 80)

var min_size = Vector2.ZERO + OFFSET
var max_size = Vector2(VIEWPORT_SIZE.x, VIEWPORT_SIZE.y) - OFFSET


func _ready() -> void:
	if not InputMap.has_action("Click"):
		InputMap.add_action("Click")
		var event = InputEventMouseButton.new()
		event.button_index = MOUSE_BUTTON_LEFT
		InputMap.action_add_event("Click", event)

# Function creates direction single reactions based on InputEvents
func _input(event: InputEvent) -> void:
	pass


func _process(delta: float) -> void:
	if Input.is_action_pressed("Click"):
		position = get_global_mouse_position()
	position.x = clamp(position.x, min_size.x, max_size.x)
	position.y = clamp(position.y, min_size.y, max_size.y)
	
