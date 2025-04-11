extends Label
const Colors : Array = [Color(0,0,0,1), Color(0,1,0,1)]
@onready var label : Label = $"."
@onready var startingColor = Colors[1]
@onready var currentColor = startingColor

var targetColor 

func _ready() -> void:
	label.add_theme_color_override("green", currentColor)

func _process(delta: float) -> void:
	
	targetColor = Colors[0]
	lerpToTarget()
	
	targetColor = Colors[1]
	lerpToTarget()

func lerpToTarget():
	while currentColor != targetColor:
		lerp(currentColor, targetColor, .1)
		return
