extends Control

@export var censoVecinos : Array[ObstacleResource]

func _ready():
	for vecino in censoVecinos:
		GlobalVars.add_vecino(vecino)
