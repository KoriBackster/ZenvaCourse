extends Node2D
@export var m_One : float = 1.00
@export var m_One_ex : int = 0

@export var m_Two : float = 1.00
@export var m_Two_ex : int = 0

@export var r : float = 1.0
@export var r_ex : int = 0

const _G : float = 6.67e-11

var answer : float

func _ready() -> void:
	if m_Two > 1.0:
		answer = (((_G) * (m_One * (10 ** m_One_ex)) * (m_Two * (10 ** m_Two_ex))) / ((r * (10 ** r_ex)) ** 2))
	else:
		answer = (((_G) * (m_One * (10 ** m_One_ex))) / ((r * (10 ** r_ex)) ** 2))
	print_debug(answer)
