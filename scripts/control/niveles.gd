extends Node

@export var duracion_inf : float = 5
@export var int_spawns_inf : float = 0.7
@export var num_spawns_inf : int = 4
@export var niveles : Array[NivelResource]
signal nivel_cambiado(int_spawns : float, num_spawns : int)

var nivel_actual : int = 0

func _ready():
	$Timer.start(niveles[0].duracion)

func _on_timer_timeout():
	nivel_actual += 1
	if nivel_actual < len(niveles):
		$Timer.start(niveles[nivel_actual].duracion)
		nivel_cambiado.emit(niveles[nivel_actual].intervaloSpawns, niveles[nivel_actual].numSpawns)
		
	else:
		$Timer.start(duracion_inf)
		nivel_cambiado.emit(int_spawns_inf, num_spawns_inf)
	print(		"Nivel ", nivel_actual)
