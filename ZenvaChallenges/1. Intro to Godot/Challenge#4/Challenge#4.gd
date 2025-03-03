extends Node

var country_name : String = "Australia"
var country_population : int = 25000000
var country_highest_altitude : float = 2228.0
var country_isLandlocked : bool = false

func _ready():
	print("Country Name: ", country_name)
	print("Country Population: ", country_population)
	print("Country Highest Altitude: ", country_highest_altitude)
	print("Country is Landlocked: ", country_isLandlocked)