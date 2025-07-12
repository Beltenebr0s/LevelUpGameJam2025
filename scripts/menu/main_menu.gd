extends Control

@export var censoVecinos : Array[ObstacleResource]

func _ready():
	AudioManager.play_menu_music()
	$Botones/Salir.visible = OS.get_name() != "Web"
	for vecino in censoVecinos:
		GlobalVars.add_vecino(vecino)
